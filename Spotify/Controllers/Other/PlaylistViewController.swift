import UIKit

class PlaylistViewController: UIViewController {

    private let playlist: Playlist
    
    private var collectionView: UICollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewCompositionalLayout { _, _ -> NSCollectionLayoutSection? in
            // Item
            let item = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .fractionalHeight(1.0)
                )
            )
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 1, leading: 2, bottom: 1, trailing: 2)
            
            // Group
            let group = NSCollectionLayoutGroup.vertical(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .absolute(60)),
                subitem: item,
                count: 1)
            
            // Section
            let section = NSCollectionLayoutSection(group: group)
            section.boundarySupplementaryItems = [
                NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .fractionalWidth(1)),
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
            ]
            return section
        }
    )
    
    init(playlist: Playlist) {
        self.playlist = playlist
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private var viewModels = [RecommendedTrackCellViewModel]()
    private var tracks = [AudioTrack]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = playlist.name
        view.backgroundColor = .systemBackground
        
        view.addSubview(collectionView)
        collectionView.register(
            RecommendedTrackCollectionViewCell.self,
            forCellWithReuseIdentifier: RecommendedTrackCollectionViewCell.identifier
        )
        collectionView.register(
            PlaylistHeaderCollectionReusableView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: PlaylistHeaderCollectionReusableView.identifier
        )
        collectionView.backgroundColor = .systemBackground
        collectionView.delegate = self
        collectionView.dataSource = self
        
        APICaller.shared.getPlaylistDatails(for: playlist) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let model):
                    // RecommendedTrackCellViewModel
                    self?.tracks = model.tracks?.items?.compactMap({ $0.track }) ?? []
                    self?.viewModels = model.tracks?.items?.compactMap({
                        RecommendedTrackCellViewModel(
                            name: $0.track?.name ?? "-",
                            artistName: $0.track?.artists.first?.name ?? "-",
                            artworkURL: URL(string: $0.track?.album?.images.first?.url ?? ""))
                    }) ?? []
                    self?.collectionView.reloadData()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .action,
            target: self,
            action: #selector(didTapShare))
    }
    
    @objc private func didTapShare() {
        print(playlist.externalUrls)
        guard let url = URL(string: playlist.externalUrls.spotify) else {
            return
        }
        
        let vc = UIActivityViewController(
            activityItems: ["¡Mira esta genial lista de reproducción que encontré!", url],
            applicationActivities: []
        )
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
}

// MARK: - CollectionView
extension PlaylistViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: RecommendedTrackCollectionViewCell.identifier,
            for: indexPath
        ) as? RecommendedTrackCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: viewModels[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: PlaylistHeaderCollectionReusableView.identifier,
            for: indexPath
        ) as? PlaylistHeaderCollectionReusableView, kind == UICollectionView.elementKindSectionHeader else {
            return UICollectionReusableView()
        }
        let headerViewModel = PlaylistHeaderViewViewModel(
            name: playlist.name,
            ownerName: playlist.owner.displayName,
            description: playlist.itemDescription,
            artworkURL: URL(string: playlist.images.first?.url ?? ""))
        header.configure(with: headerViewModel)
        // Decimos que los encabezados delegan recibir los eventos en si mismos.
        header.delegate = self
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        // Play song
        let index = indexPath.row
        let track = tracks[index]
        PlaybackPresenter.startPlayback(from: self, track: track)
    }
}

// MARK: Delegates PlaylistHeaderCollectionReusableView
extension PlaylistViewController: PlaylistHeaderCollectionReusableViewDelegate {
    // Aqui hemos separado claramente nuestra responsabilidades de vista y controlador
    // Aqui hay una lista de resproduccion quue podrias agregar
    func PlaylistHeaderCollectionReusableViewDidTapPlayAll(_ header: PlaylistHeaderCollectionReusableView) {
        // Start play list in queue
        print("Playing all")
        PlaybackPresenter.startPlayback(
            from: self,
            tracks: tracks
        )
    }
}
