import UIKit

class LibraryAlbumsViewController: UIViewController {

    var albums = [Album]()
    //var albums = [AlbumItems]()
    
    private let noAlbumView = ActionLabelView()
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(
            SearchResultSubtitleTableViewCell.self,
            forCellReuseIdentifier: SearchResultSubtitleTableViewCell.identifier
        )
        tableView.isHidden = true
        return tableView
    }()
    
    // Observar la notificación si se disparó o no
    private var observer: NSObjectProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        view.backgroundColor = .green
        setUpNoAlbumsView()
        fetchData()
        observer = NotificationCenter.default.addObserver(
            forName: .albumSaveNotification,
            object: nil,
            queue: .main,
            using: { [weak self] _ in
                self?.fetchData()
            })
    }
    
    @objc func didTapClose() {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        noAlbumView.frame = CGRect(x: (view.width-150)/2, y: (view.height-150)/2, width: 150, height: 150)
        noAlbumView.center = view.center
        tableView.frame = view.bounds
    }
    
    private func setUpNoAlbumsView() {
        view.addSubview(noAlbumView)
        noAlbumView.delegate = self
        noAlbumView.configure(
            with: ActionLabelViewViewModel(
                text: "You have not saved any albums yet. ",
                actionTitle: "Browse")
        )
    }
    
    private func fetchData() {
        albums.removeAll()
        APICaller.shared.getCurrentUserAlbums { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let albums):
                    self?.albums = albums
                    self?.updateUI()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    private func updateUI() {
        if albums.isEmpty {
            // Show label
            noAlbumView.backgroundColor = .red
            noAlbumView.isHidden = false
            tableView.isHidden = true
        } else {
            // Show Table
            tableView.reloadData()
            noAlbumView.isHidden = true
            tableView.isHidden = false
        }
    }
}

extension LibraryAlbumsViewController: ActionLabelViewDelegate {
    func actionLabelViewDidTapButton(_ actionView: ActionLabelView) {
        tabBarController?.selectedIndex = 0
    }
}

extension LibraryAlbumsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: SearchResultSubtitleTableViewCell.identifier,
            for: indexPath
        ) as? SearchResultSubtitleTableViewCell else {
            return UITableViewCell()
        }
        let album = albums[indexPath.row]
        cell.configure(with: SearchResultSubtitleTableViewCellViewModel(
            title: album.name,
            subtitle: album.artists.first?.name ?? "-",
            imageURL: URL(string: album.images.first?.url ?? "")))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        HapticsManager.shared.vibrateForSelecction()
        let album = albums[indexPath.row]
        let vc = AlbumViewController(album: album)
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
