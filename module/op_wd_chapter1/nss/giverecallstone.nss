void main()
{
    object oPC = GetPCSpeaker();
    if(GetIsObjectValid(GetItemPossessedBy(oPC,"NW_IT_RECALL")) == FALSE)
    {
        CreateItemOnObject("NW_IT_RECALL",oPC);
    }
}

