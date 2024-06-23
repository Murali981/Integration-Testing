docker-compose up -d
echo '🟡 - Waiting for database to be ready...'
./scripts/wait-for-it.sh "postgresql://postgres:mysecretpassword@localhost:54320/postgres" -- echo '🟢 - Database is ready!'
# The above line means that it waits until the postgres database is up and unless it is up it will not move to the next line where it
# migrates the database 
npx prisma migrate dev --name init
npm run test
docker-compose down