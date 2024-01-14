# How to set up the project

### System dependencies
  -  Ruby version:  3.2.2 
  -  Gem dependencies: 
     -  rails 7.1.2
     -  PostgreSQL 16.1 (deployment on Render)
     -  SQLite 3 (local deployment)
  - Node.js v21.5.0
  - npm v10.2.5
 
### test on local environment
- Clone the repo to the local environment from the **master** branch
- Use command ```rails server -p #[port_number]#``` to run the rails API.
- The API will be running "**<a>http://localhost:port_number</a>**"
- If neccessary, change the destination address of HTTP post in the frontend client repo

### test the deployed product
- The rails api is deployed on **Render** platform using its free web services
- The Postgres database is also deployed on **Render**
- The URL for the API endpoint is "**<a>https://demo-iu1g.onrender.com/:element</a>**"
- available element includes: emails, articles, comments 
