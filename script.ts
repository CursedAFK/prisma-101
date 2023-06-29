import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

async function main() {
  const user = await prisma.user.deleteMany({
    where: {
      age: {
        gt: 20
      }
    }
  })

  console.log(user)
}

main()
  .catch(function (err) {
    console.error(err.message)
  })
  .finally(async function () {
    await prisma.$disconnect()
  })
