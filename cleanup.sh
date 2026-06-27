#!/bin/bash

echo "==============================="
echo " Docker Compose Cleanup Script"
echo "==============================="
echo ""

# Ask user what they want to do
echo "Choose cleanup option:"
echo "  1) Stop containers only (keep volume + data)"
echo "  2) Remove containers + network (keep volume + data)"
echo "  3) Remove everything including volume (DATA DELETED)"
echo ""
read -p "Enter choice [1-3]: " choice

case $choice in
  1)
    echo ""
    echo ">> Stopping containers..."
    docker compose stop
    echo ">> Done. Containers stopped. Volume and data intact."
    ;;
  2)
    echo ""
    echo ">> Removing containers and network..."
    docker compose down
    echo ">> Done. Volume and data intact."
    ;;
  3)
    echo ""
    read -p "WARNING: This will delete all data. Are you sure? (yes/no): " confirm
    if [ "$confirm" == "yes" ]; then
      echo ">> Removing containers, network, and volume..."
      docker compose down -v
      echo ">> Done. Everything removed including volume."
    else
      echo ">> Aborted. Nothing was deleted."
    fi
    ;;
  *)
    echo ">> Invalid choice. Exiting."
    exit 1
    ;;
esac

echo ""
echo ">> Current container status:"
docker compose ps

echo ""
echo ">> Remaining volumes:"
docker volume ls | grep flask || echo "No project volumes found."
