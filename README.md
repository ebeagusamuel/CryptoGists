# CryptoGist
###  An online platform where cryptocurrency enthusiasts come to share gists about things happening in the cryptocurrency ecosystem.

> This project was built as my capstone for the ROR curriculum of the Microverse software development school. It is a fullstack project built using the rails framework. Basically a user can sign up on the platform, and post gists which other users can comment on. Users can also follow and unfollow other users.


## Live Demo and Presentation

- The project was deployed on Heroku: [Live Demo Link](https://sheltered-crag-80749.herokuapp.com/)
- [Presentation Video](https://www.loom.com/share/ab723e1e89bf4676a85b34236c68a8cd)


<p align="center">
  <img src="https://user-images.githubusercontent.com/57847212/89536674-2caed680-d7f0-11ea-8bb3-f166f7ce3b46.png"/>
</p>

<p align="center">
  <img src="https://user-images.githubusercontent.com/57847212/89537280-02114d80-d7f1-11ea-997e-cbde007b0d9f.png"/>
</p>

## Built With

- Ruby 2.7 and Rails 6.0.3
- Bootstrap 4
- Deployed on Heroku

To get a local copy up and running follow these steps:

### Prerequisites

- Ruby: 2.7
- Rails: 6.0.3
- SQLite
- Git

### Usage

- Fork/Clone this project to your local machine and checkout to required branch:

```Bash
    git clone https://github.com/ebeagusamuel/CryptoGists.git
    cd crypto-gist
    git checkout gists
```

```Ruby
    bundle install
```

Setup database with:

```Ruby
    yarn install --check-files
    rails db:create
    rails db:migrate
```

Start server with:

```Ruby
    rails server
```
#### Active Storage Setup - Optional
AWS S3 buckets was used for active storage in production, while in development local disk was used for active storage. Follow this [tutorial](https://medium.com/@iachieve80/rails-6-0-upload-images-using-active-storage-and-amazon-simple-storage-service-amazon-s3-36861c03dc4a) to learn how to set up AWS S3 for active storage.

### Running tests

```Ruby
    bundle exec rspec --format documentation
```
(Note that to run the test, you will need to have chrome browser installed on your computer)

### Deployment
The project was depolyed to heroku. If you set up AWS S3 for active storage and want to deploy your own copy to heroku, then you will need to allow heroku access the encrypted API keys by running

```Ruby
    heroku config:set RAILS_MASTER_KEY= <master.key>
```

(The master key can be found in the `/config/master.key` file)

## Authors

👤 **Ebeagu Samuel**

- Github: [@ebeagusamuel](https://github.com/ebeagusamuel)
- Twitter: [@ebeagu_samuel](https://twitter.com/ebeagu_samuel)
- LinkedIn: [ebeagusamuel](https://linkedin.com/isghoor)
- Email: [consult.samuelebeagu@gmail.com](mailto:consult.samuelebeagu@gmail.com)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/ebeagusamuel/CryptoGists/issues)

Start by:

- Forking the project
- Cloning the project to your local machine
- `cd` into the project directory
- Run `git checkout -b your-branch-name.`
- Make your contributions
- Push your branch up to your forked repository
- Open a Pull Request with a detailed description of the development(or master if not available) branch of the original project for a review

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- [Microverse](https://www.microverse.org)
- [Gregoire Vella](https://www.behance.net/gregoirevella) for the design.

## 📝 License

This project is [MIT](LICENSE) licensed with the exception of the design, which is under the [Creative Commons License](https://creativecommons.org/licenses/by-nc-nd/4.0/) and attributed to [Gregoire Vella](https://www.behance.net/gregoirevella).
