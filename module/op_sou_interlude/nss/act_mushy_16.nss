//Give PC bottle of wine for Torias and take 150 gold.
void main()
{
    CreateItemOnObject("q5b_bottle",GetPCSpeaker());
    TakeGoldFromCreature(150,GetPCSpeaker());
}
