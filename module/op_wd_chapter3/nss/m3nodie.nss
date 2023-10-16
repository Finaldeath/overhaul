//  * This creature's body won't disappear when die

// * THIS SCRIPT CAN ONLY BE USED FOR KLAUTH!!!!!!
void main()
{
//    SetIsDestroyable(FALSE,FALSE,FALSE);
 /*   location lLoc = GetLocation(OBJECT_SELF);
    object oArea = GetAreaFromLocation(lLoc);
    float fFace = GetFacingFromLocation(lLoc);
    vector vPos = GetPositionFromLocation(lLoc);
    vPos.x = vPos.x + 3.0;
    vPos.y = vPos.y + 3.0;
    lLoc = Location(oArea, vPos, fFace);
    object oBody = CreateObject(OBJECT_TYPE_PLACEABLE, "PLC_LOOTBAG3",lLoc);  */

    // * May 2002: If there is a valid master, it means that one ofthe player's
    // * associates did the killing. Spawn the item on the master instead.

/*    object oMaster = GetMaster(GetLastKiller());
    object oGetItem = GetLastKiller();
    if (GetIsObjectValid(oMaster) == TRUE)
    {
        oGetItem = oMaster;
    }
  //  CreateItemOnObject("M3Q4_F02_KLAUTH", oGetItem);


    if (!GetIsObjectValid(GetItemPossessedBy(oGetItem,"M3Q04H07_Lock")))
    {
        CreateItemOnObject("M3Q04H07_Lock", oGetItem);
    }*/
    ///////Clears up journal entries that cannot be completed because this character is dead
    AddJournalQuestEntry("M3Q04_H07_KLAU",99,GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC), TRUE,TRUE);
    SetLocalInt(GetModule(),"NW_G_KLAUTHDEAD",99);
    location lWay1 = GetLocation(GetObjectByTag("WP_M3Q4HCKLAUTH1"));
    location lWay2 = GetLocation(GetObjectByTag("WP_M3Q4HCKLAUTH2"));
    location lWay3 = GetLocation(GetObjectByTag("WP_M3Q4HCKLAUTH3"));
    CreateObject(OBJECT_TYPE_PLACEABLE,"M3Q4HC_KLAUTH1",lWay1);
    CreateObject(OBJECT_TYPE_PLACEABLE,"M3Q4HC_KLAUTH2",lWay2);
    CreateObject(OBJECT_TYPE_PLACEABLE,"M3Q4HC_KLAUTH3",lWay3);
}
