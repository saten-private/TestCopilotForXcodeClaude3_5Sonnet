import UIKit

class TwitterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tweets: [Tweet] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupNavigationBar()
        loadSampleTweets()
    }

    func loadSampleTweets() {
        let usernames = ["Alice", "Bob", "Charlie", "David", "Eva"]
        let profileImages = ["profile1", "profile2", "profile3", "profile4", "profile5"]
        
        for i in 1...50 {
            let username = usernames[i % usernames.count]
            let profileImage = profileImages[i % profileImages.count]
            let content = "This is sample tweet number \(i). #SampleTweet"
            let tweet = Tweet(username: username, profileImageName: profileImage, content: content)
            tweets.append(tweet)
        }
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TweetCell.self, forCellReuseIdentifier: "TweetCell")
    }
    
    func setupNavigationBar() {
        navigationItem.title = "Home"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(composeTweet))
    }
    
    @objc func composeTweet() {
        // ツイート投稿画面を表示
    }
    
    // UITableViewDataSource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TweetCell", for: indexPath) as! TweetCell
        cell.configure(with: tweets[indexPath.row])
        return cell
    }
}
