//::///////////////////////////////////////////////
//:: Witch Wake 1: Raggletag, User-Defined
//:: WW1_Raggletag_UD.nss
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Raggletag drops a gold coin OnDamage.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: December 8, 2002
//:://////////////////////////////////////////////

void main()
{
    //Process Default User-Defined Events
    int iUDNum = GetUserDefinedEventNumber();
    switch (iUDNum)
    {
        case 1001: //User-Defined Heartbeat Event
        {

        }
        break;

        case 1002: //User-Defined OnPerceive Event
        {

        }
        break;

        case 1003: //User-Defined EndCombatRound Event
        {

        }
        break;

        case 1004: //User-Defined OnDialog Event
        {

        }
        break;

        case 1005: //User-Defined OnAttack Event
        {

        }
        break;

        case 1006: //User-Defined OnDamaged Event
        {
            int iDoOnce = GetLocalInt(OBJECT_SELF, "bDroppedCoin");

            if (iDoOnce == FALSE)
            {
                location lLoc = GetLocation(OBJECT_SELF);
                CreateObject(OBJECT_TYPE_ITEM, "nw_it_gold001", lLoc);
                SetLocalInt(OBJECT_SELF, "bDroppedCoin", TRUE);
            }
        }
        break;

        case 1007: //User-Defined OnDeath Event
        {

        }
        break;

        case 1008: //User-Defined OnDisturbed Event
        {

        }
        break;
    }
}
