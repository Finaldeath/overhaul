//::///////////////////////////////////////////////
//:: Mythallar (OnDeath)
//:: Dt_Mythallar.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Handle the destruction of the Mythallar.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 19, 2003
//:://////////////////////////////////////////////
#include "nw_i0_generic"

void main()
{
    object oHeurodis = GetNearestObjectByTag("Heurodis");

    //If the Mythallar is destroyed once it's isolated, Heurodis is made
    //vulnerable.
    int bActive = GetLocalInt(OBJECT_SELF, "bActive");
    int iDestroyed = GetLocalInt(GetArea(OBJECT_SELF), "iMythallarDestroyed");
    if (bActive == TRUE)
    {
        object oArea = GetArea(OBJECT_SELF);
        SetLocalInt(oArea, "bMythallarDestroyed", TRUE);
        SetPlotFlag(oHeurodis, FALSE);

        //Play VO.
        AssignCommand(oHeurodis, SpeakStringByStrRef(40139, TALKVOLUME_SHOUT));
        AssignCommand(oHeurodis, PlaySoundByStrRef(76029, FALSE));

        //Screenshake for all players.
        effect eShake = EffectVisualEffect(VFX_FNF_SCREEN_SHAKE);
        int iNth = 1;
        object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF, iNth);
        while (oPC != OBJECT_INVALID)
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eShake, oPC);
            iNth++;
            oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF, iNth);
        }

        //Add journal entry.
        AddJournalQuestEntry("Journ_Main_40", 1, oPC, TRUE, TRUE);

        //Give XP to everyone
        object oPC_XP = GetFirstPC();
        while (oPC_XP != OBJECT_INVALID)
        {
            int bXP = GetLocalInt(oPC_XP, "XP_Main_10");
            if (bXP == FALSE)
            {
                SetLocalInt(oPC_XP, "XP_Main_10", TRUE);
                float fPercent = (15 - iDestroyed)/100.00;
                int iXP = FloatToInt(GetJournalQuestExperience("Journ_Main_End") * fPercent);
                GiveXPToCreature(oPC_XP, iXP);
            }
            oPC_XP = GetNextPC();
        }

        //Activate Wind Sounds (City is Falling now)
        object oSound1 = GetObjectByTag("snd_winds04_wind_1");
        object oSound2 = GetObjectByTag("snd_winds04_wind_2");
        DelayCommand(1.0, SoundObjectPlay(oSound1));
        SoundObjectPlay(oSound2);

        //Set Tremors Active in the Area. (and other city falling effects)
        SetLocalInt(oArea, "nTremorsActive", 1);

        //Lock force doors so PCs cannot leave the area again..
        /* DOORS PERMANENTLY LOCKED**
        object oDoor1 = GetObjectByTag("Winds_04_E_Winds_03_E");
        object oDoor2 = GetObjectByTag("Winds_04_N_Winds_03_N");
        object oDoor3 = GetObjectByTag("Winds_04_S_Winds_03_S");
        object oDoor4 = GetObjectByTag("Winds_04_W_Winds_03_W");

        AssignCommand(oDoor1, ActionCloseDoor(oDoor1));
        AssignCommand(oDoor2, ActionCloseDoor(oDoor2));
        AssignCommand(oDoor3, ActionCloseDoor(oDoor3));
        AssignCommand(oDoor4, ActionCloseDoor(oDoor4));
        SetLocked(oDoor1, TRUE);
        SetLocked(oDoor2, TRUE);
        SetLocked(oDoor3, TRUE);
        SetLocked(oDoor4, TRUE);
        */
        //Destroy All Mythalar in a chain reaction
        SignalEvent(oArea, EventUserDefined(1999));
    }
    else
    {
        SetLocalInt(GetArea(OBJECT_SELF), "iMythallarDestroyed", iDestroyed+1);
        if (GetIsDead(oHeurodis) == FALSE)
        {
            //Play VO.
            int iRandom = Random(2)+1;
            if (iRandom == 1)
            {
                PlayVoiceChat(VOICE_CHAT_THREATEN, oHeurodis);
            }
            if (iRandom == 2)
            {
                PlayVoiceChat(VOICE_CHAT_LAUGH, oHeurodis);
            }
        }
    }
    if (GetLocalInt(GetModule(), "X1_HeurodisCharge") == 1)
        return;
    //Turn Heurodis hostile if she isn't already.
    SetLocalInt(GetModule(), "X1_HeurodisCharge", 1);

    ChangeToStandardFaction(oHeurodis, STANDARD_FACTION_HOSTILE);
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oHeurodis);
    AssignCommand(oHeurodis, ActionMoveToObject(oPC, TRUE, 10.0));
    AssignCommand(oHeurodis, DetermineCombatRound());
}
