// this script will need to be altered so that Rimardo gives
// whatever items he has in inventory to the speaker

void main()
{
    SetLocalInt(OBJECT_SELF,"Rimardo_Gave_Items",1);
    object oItem1 = GetItemPossessedBy(OBJECT_SELF,"NW_IT_MPOTION017");
    object oItem2 = GetItemPossessedBy(OBJECT_SELF,"NW_IT_MPOTION002");
    object oItem3 = GetItemPossessedBy(OBJECT_SELF,"2Q6_LetterGolem");
    object oItem4 = GetItemPossessedBy(OBJECT_SELF,"NW_IT_WSWMDG004");
    object oItem5 = GetItemPossessedBy(OBJECT_SELF,"NW_IT_MRING014");
    object oItem6 = GetItemPossessedBy(OBJECT_SELF,"NW_IT_MRING008");
    if (GetIsObjectValid(oItem1))
    {
        ActionGiveItem(oItem1,GetPCSpeaker());
    }
    if (GetIsObjectValid(oItem2))
    {
        ActionGiveItem(oItem2,GetPCSpeaker());
    }
    if (GetIsObjectValid(oItem3))
    {
        ActionGiveItem(oItem3,GetPCSpeaker());
    }
    if (GetIsObjectValid(oItem4))
    {
        ActionGiveItem(oItem4,GetPCSpeaker());
    }
    if (GetIsObjectValid(oItem5))
    {
        ActionGiveItem(oItem5,GetPCSpeaker());
    }
    if (GetIsObjectValid(oItem6))
    {
        ActionGiveItem(oItem6,GetPCSpeaker());
    }
}
