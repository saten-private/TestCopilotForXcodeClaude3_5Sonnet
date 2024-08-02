import UIKit

class TweetCell: UITableViewCell {
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 25
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let tweetContentLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(profileImageView)
        contentView.addSubview(usernameLabel)
        contentView.addSubview(tweetContentLabel)
        
        NSLayoutConstraint.activate([
            profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            profileImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            profileImageView.widthAnchor.constraint(equalToConstant: 50),
            profileImageView.heightAnchor.constraint(equalToConstant: 50),
            
            usernameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 12),
            usernameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            usernameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            
            tweetContentLabel.leadingAnchor.constraint(equalTo: usernameLabel.leadingAnchor),
            tweetContentLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 4),
            tweetContentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            tweetContentLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }
    
    func configure(with tweet: Tweet) {
        profileImageView.image = UIImage(named: tweet.profileImageName)
        usernameLabel.text = tweet.username
        tweetContentLabel.text = tweet.content
    }
}
