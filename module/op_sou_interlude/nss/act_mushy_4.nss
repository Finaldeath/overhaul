//Give PC bottle of wine for Torias and take 200 gold.
void main()
{
    CreateItemOnObject("q5b_bottle",GetPCSpeaker());
    TakeGoldFromCreature(200,GetPCSpeaker());
}
