// Deekin takes the shoe OR the shoe is destroyed

void main()
{
    object oShoe = GetItemPossessedBy(GetPCSpeaker(), "q5_Deekin_Shoe");
    if (GetIsObjectValid(oShoe))
    {
        ActionPauseConversation();
        ActionTakeItem(oShoe, GetPCSpeaker());
        ActionResumeConversation();
    }
    else
    {
        oShoe = GetObjectByTag("q5_Deekin_Shoe");
        if (GetIsObjectValid(oShoe))
        {
            DestroyObject(oShoe);
        }
    }
}
