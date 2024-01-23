# How to set up the project

### Branches
- the **master** branch is for test on local environment
- the **deployment** branch is for the deployment on **Render**
- the **new feature** branch is for the creation of new features

### System dependencies
  -  Ruby v3.2.2 
  -  rails v7.1.2
  -  PostgreSQL 16.1 (deployment on Render)
  -  SQLite 3 (local deployment)
  - Node.js v21.5.0
  - npm v10.2.5
 
### Test on local environment
- Install system dependencies on local environment
- Clone the repo to the local environment from the **master** branch
- Use command ```rails server -p #[port_number]#``` to run the rails API.
- The API will be running "**<a>http://localhost:port_number</a>**"
- If neccessary, change the destination address of HTTP post in the frontend client repo

### Test the deployed product
- The rails API is deployed on **Render** platform using its free web services
- The URL for the rails API endpoint is "**<a>https://demo-iu1g.onrender.com/:element</a>**"
- available element includes: emails, articles, comments 
- The Postgres database is also deployed on **Render**
- Database information
  - **hostname**: dpg-cmgto07qd2ns73fmih5g-a
  - **Port**: 5432
  - **db**: test_db_p337
  - **username**: remote

### Miscellaneous Notes
- The rails API and PostgreSQL database is deployed on Render under free plans
- Free instances may have some limitations (**<a href="https://docs.render.com/free">https://docs.render.com/free</a>**)
- Free web service may be spinned down on idle. Refreshing the log-in page when an authentication for a registered email fails
- There is a monthly usage limit of 750 hours for rails API
- There is a 90-day limit for the PostgreSQL on the platform. Database will expire after 90 days.
- I have setup a cron job at [cron-job.org](https://console.cron-job.org/dashboard) to ping the server every 15 minutes to prevent it from spinning down. 
