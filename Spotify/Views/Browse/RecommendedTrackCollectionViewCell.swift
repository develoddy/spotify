
import UIKit

class RecommendedTrackCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "RecommendedTrackCollectionViewCell"
    
    private let albumCoverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "photo")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let trackNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    private let artistsNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .thin)
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .secondarySystemBackground
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubview(albumCoverImageView)
        contentView.addSubview(trackNameLabel)
        contentView.addSubview(artistsNameLabel)
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        albumCoverImageView.frame = CGRect(x: 5, y: 2, width: contentView.height-4, height: contentView.height-4)
        trackNameLabel.frame = CGRect(
            x: albumCoverImageView.right+10,
            y: 0,
            width: contentView.width-albumCoverImageView.right-15,
            height: contentView.height/2)
        
        artistsNameLabel.frame = CGRect(
            x: albumCoverImageView.right+10,
            y: contentView.height/2,
            width: contentView.width-albumCoverImageView.right-15,
            height: contentView.height/2)
        
        /*artistsNameLabel.frame = CGRect(
            x: 3,
            y: contentView.height-30,
            width: contentView.width-6,
            height: 30)
        
        trackNameLabel.frame = CGRect(
            x: 3,
            y: contentView.height-60,
            width: contentView.width-6,
            height: 30)
        
        let imageSize = contentView.height-70
        albumCoverImageView.frame = CGRect(
            x: (contentView.width-imageSize)/2,
            y: 3, width:
                imageSize,
            height: imageSize)*/
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        trackNameLabel.text = nil
        albumCoverImageView.image = nil
        artistsNameLabel.text = nil
    }
    
    func configure(with viewModel: RecommendedTrackCellViewModel) {
        trackNameLabel.text = viewModel.name
        albumCoverImageView.sd_setImage(with: viewModel.artworkURL, completed: nil)
        artistsNameLabel.text = viewModel.artistName
    }
}
