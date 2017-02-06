curl -s localhost:3490/v1/unpulsed | sed 's/[:,]/ /g' | awk {'print $6'} | xargs printf "%'.f"
