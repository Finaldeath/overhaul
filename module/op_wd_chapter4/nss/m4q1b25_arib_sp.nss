///////////////////////////////////////////////
//:: Surrender User Defined, Custom For Aribeth
//:: SURRENDER_UDEF
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Goes through a 20ft radius around the NPC and
    sets all people to clear all actions and
    improves the reputation of enemies towards the
    NPC and clears their actions
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Nov 16, 2001
//:://////////////////////////////////////////////

void main()
{
    int nUser = GetUserDefinedEventNumber();
    //* Perceived
    if (nUser == 1002)
    {
        if (GetLocalInt(OBJECT_SELF,"NW_L_DOONCE") ==0)
        {
            ActionStartConversation(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR,PLAYER_CHAR_IS_PC));
//            SpeakOneLinerConversation();
            SetLocalInt(OBJECT_SELF,"NW_L_DOONCE",1);
        }
    }
    else
    // * Damaged
    if(nUser == 1006)
    {
        int nMaxHP = GetMaxHitPoints();
        int nCurrHP = GetCurrentHitPoints();
         // * generic surrender should only fire once
          // * generic surrender should only fire once
        if (GetLocalInt(OBJECT_SELF,"NW_L_DOTHISONCE") == 0)
        if((nCurrHP * 3) <= nMaxHP && GetLocalInt(OBJECT_SELF,"Generic_Surrender") == 0)
        {
            //SpeakString("should surrender");
           // ClearAllActions();
            SurrenderToEnemies();
            //AssignCommand(GetLastAttacker(), ClearAllActions());
            // * SHOULDN'T HAVE TO DO THIS
           //SetIsTemporaryEnemy(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC));
            SetLocalInt(OBJECT_SELF,"Generic_Surrender",1)   ;
            SpeakOneLinerConversation();
            SetLocalInt(OBJECT_SELF,"NW_L_DOTHISONCE",1);
        }
/*        else
        //* Jump into cage, heal self and jump out
        if (GetIsObjectValid(GetNearestObjectByTag("M4Q1B25TheCage")) == TRUE)
        if( ((nCurrHP * 2) <= nMaxHP) && GetLocalInt(OBJECT_SELF,"Generic_Surrender") == 0)
        {
            effect eVis = EffectVisualEffect(VFX_IMP_UNSUMMON);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, OBJECT_SELF);
            location nOldLoc = GetLocation(OBJECT_SELF);
            ClearAllActions();
            JumpToObject(GetObjectByTag("M4Q1B25_AribGoTo"), FALSE);
            ActionCastSpellAtObject(SPELL_HEAL, OBJECT_SELF, METAMAGIC_ANY, TRUE);
            ActionJumpToLocation(nOldLoc);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, OBJECT_SELF);
            ActionDoCommand(SetCommandable(TRUE));
            SetCommandable(FALSE);
           // JumpToLocation(nOldLoc);
        }*/

    }
}



