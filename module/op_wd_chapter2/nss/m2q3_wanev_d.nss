///////////////////////////////////////////////
//:: Surrender User Defined
//:: M2Q3_Wanev_D
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Goes through a 20ft radius around the NPC and
    sets all people to clear all actions and
    improves the reputation of enemies towards the
    NPC and clears their actions
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: April 9, 2002
//:://////////////////////////////////////////////

void main()
{
    int nUser = GetUserDefinedEventNumber();
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
    object oPortal = GetObjectByTag("WP_WANTOWEXIT");

    if (nUser == 300)
    {
        PlayAnimation(ANIMATION_FIREFORGET_BOW);
        CreateObject(OBJECT_TYPE_PLACEABLE,"M2Q3D_Portal",GetLocation(oPortal));
        ActionDoCommand(DestroyObject(OBJECT_SELF));
        SetCommandable(FALSE);
    }
    else
    if (nUser == 301)
    {
        PlayAnimation(ANIMATION_FIREFORGET_BOW);
        ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_HEALING_G),OBJECT_SELF);
        ActionWait(1.0);
        ActionDoCommand(DestroyObject(OBJECT_SELF));
        SetCommandable(FALSE);
    }
    else
    if (nUser == 1002)
    {
        if (GetLocalInt(OBJECT_SELF,"NW_L_DOONCE") ==0)
        {
//            ActionStartConversation(OBJECT_SELF);
            SpeakOneLinerConversation();
            SetLocalInt(OBJECT_SELF,"NW_L_DOONCE",1);
        }
    }
    else
    if(nUser == 1006)
    {
        int nMaxHP = GetMaxHitPoints();
        int nCurrHP = GetCurrentHitPoints();

         // * generic surrender should only fire once
        if((nCurrHP <= 30) && GetLocalInt(OBJECT_SELF,"Generic_Surrender") == 0)
        {
            SetLocalInt(OBJECT_SELF, "Generic_Surrender",1);
            SurrenderToEnemies();
            ClearAllActions();
            SpeakOneLinerConversation();
        }
    }
}
