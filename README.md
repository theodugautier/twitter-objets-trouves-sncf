<p align="center">
  <a href="https://www.twitter.com/sncfobjets " target="_blank" rel="noopener noreferrer">
    <img width="256" src="https://i.imgur.com/d0LOjFS.png" alt="SNCF Bot Logo">
  </a>
</p>

# Bot Twitter Objets trouvé SNCF

Bot twitter developed in ruby that tweets the objects found in the trains of the SNCF.

For that I used the open data of the SNCF : https://ressources.data.sncf.com/explore/dataset/objets-trouves-restitution/table/?sort=date

## 📥 Installation

Requirements :
- Sqlite3
- Ruby 2.7.4

Clone this repo :
```
$ git clone git@github.com:theodugautier/twitter-objets-trouves-sncf.gi
```

Put your environment variables in the `.env` file (sqlite3 and twitter api's keys) :
```
$ cp .env.example .env
```

And then execute :
```
$ bundle install
```

Finally to run scheduler :
```
ruby lib/scheduler.rb
```

## 👨‍💻 Contributing

To contribute to this repository, feel free to create a new fork of the repository and submit a pull request.
- Fork / Clone and select the main branch.
- Create a new branch in your fork.
- Make your changes.
- Commit your changes, and push them.
- Submit a Pull Request here!

## 📋 License

The gem is available as open source under the terms of the [WTFPL](http://www.wtfpl.net/).
