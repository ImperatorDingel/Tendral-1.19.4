Economy_Tendral:

  type: economy

  # The Bukkit service priority. Priorities are Lowest, Low, Normal, High, Highest.
  priority: normal
  # The name of the currency in the singular (such as "dollar" or "euro").
  name single: Münze
  # The name of the currency in the plural (such as "dollars" or "euros").
  name plural: Münzen
  # How many digits after the decimal to include. For example, '2' means '1.05' is a valid amount, but '1.005' will be rounded.
  digits: 0
  # Format the standard output for the money in human-readable format. Use "<amount>" for the actual amount to display.
  # Fully supports tags.
  format: <white><[amount].proc[Economy_Tendral_proc2]>

  # A tag that returns the balance of a linked player. Use a 'proc[]' tag if you need more complex logic.
  # Must return a decimal number.
  balance: <player.flag[Profil.Economy.Money].add[<player.flag[Profil.Economy.Bank]>]>
  # A tag that returns a boolean indicating whether the linked player has the amount specified by auto-tag "<amount>".
  # Use a 'proc[]' tag if you need more complex logic.
  # Must return 'true' or 'false'.
  has: <player.flag[money].is[or_more].than[<amount>]>
  # A script that removes the amount of money needed from a player.
  # Note that it's generally up to the systems calling this script to verify that the amount can be safely withdrawn, not this script itself.
  # However you may wish to verify that the player has the amount required within this script.
  # The script may determine a failure message if the withdraw was refused. Determine nothing for no error.
  # Use def 'amount' for the amount to withdraw.
  withdraw:
  - flag <player> money:-:<[amount]>
  # A script that adds the amount of money needed to a player.
  # The script may determine a failure message if the deposit was refused. Determine nothing for no error.
  # Use def 'amount' for the amount to deposit.
  deposit:
  - flag <player> money:+:<[amount]>


Economy_Tendral_proc2:
  type: procedure
  debug: false
  data:
    currency:
        copper: <gold><&chr[1001].font[economy-icons]><bold>
        silver: <gray><&chr[1001].font[economy-icons]><bold>
        gold: <yellow><&chr[1001].font[economy-icons]><bold>
        diamond: <aqua><&chr[1001].font[economy-icons]><bold>
        emerald: <green><&chr[1001].font[economy-icons]><bold>
  definitions: amount
  script:
    - foreach <script.parsed_key[data.currency]> key:currency as:icon:
      - if <[currency]> == emerald:
        - define currencies:->:<[icon]><[amount].mul[100]>
        - foreach next
      - define amount <[amount].round_down.div[100]>
      - define currencies:->:<[icon]><[amount].mod[1].mul[100].round>
    - determine <[currencies].reverse.space_separated>
