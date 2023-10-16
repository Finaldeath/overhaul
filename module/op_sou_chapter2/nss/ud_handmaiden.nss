//::///////////////////////////////////////////////
//:: Medusa Handmaiden (UserDefined)
//:: UD_Handmaiden.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Make them bow.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 21, 2003
//:://////////////////////////////////////////////

void main()
{
    int iUDNum = GetUserDefinedEventNumber();

    //User-Defined OnSpawn (100)
    if (iUDNum == 100)
    {

    }

    //User-Defined OnHeartbeat (1001)
    if (iUDNum == 1001)
    {
        object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
        if (oPC != OBJECT_INVALID)
        {
            int bInCombat = GetIsInCombat(OBJECT_SELF);
            int bWorshipComplete = GetLocalInt(OBJECT_SELF, "bWorshipComplete");
            if (bInCombat == FALSE &&
                bWorshipComplete == FALSE)
            {
/*DEBUG*///SpeakString("Playing Animation...", TALKVOLUME_SHOUT);
                PlayAnimation(ANIMATION_LOOPING_WORSHIP, 1.0, 7.0);
            }
            else if (bInCombat == TRUE &&
                     bWorshipComplete == FALSE)
            {
                SetLocalInt(OBJECT_SELF, "bWorshipComplete", TRUE);
            }
            //Do a double-check on the distance just to catch any others who
            //might have fallen through the cracks.
            float bDistance = GetDistanceToObject(oPC);
            if (bDistance < 10.0)
            {
                SetLocalInt(OBJECT_SELF, "bWorshipComplete", TRUE);
            }
        }
    }

    //User-Defined OnPerceive (1002)
    if (iUDNum == 1002)
    {

    }

    //User-Defined OnAttacked (1005)
    if (iUDNum == 1005)
    {

    }

    //User-Defined OnDamaged (1006)
    if (iUDNum == 1006)
    {

    }

    //User-Defined OnDeath (1007)
    if (iUDNum == 1007)
    {
    }

    //User-Defined OnDisturbed (1008)
    if (iUDNum == 1008)
    {

    }

    //User-Defined OnCombatRoundEnd (1003)
    if (iUDNum == 1003)
    {

    }

    //User-Defined OnDialog (1004)
    if (iUDNum == 1004)
    {

    }

    return;
}
