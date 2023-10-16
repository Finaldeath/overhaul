//::///////////////////////////////////////////////////
//:: X0_C2_DTH_LOOT
//:: OnDeath handler.
//:: Leave a lootable corpse that will never decay.
//::
//:: Copyright (c) 2002 Floodgate Entertainment
//:: Created By: Naomi Novik
//:: Created On: 12/07/2002
//::///////////////////////////////////////////////////

#include "nw_i0_generic"
#include "x0_i0_corpses"
#include "x0_i0_common"

void CheckForInterjection(object oPC, int nEventNum);
void DoInterjection(object oHench, object oPC, int MOD_EVENT_NUMBER);
int ValidForInterjection(object oPC, object oHench);

void main()
{

    // * make sure this can happen only once.
    if (GetLocalInt(OBJECT_SELF, "NW_L_DEATHEVENTFIRED") == 10) return;
    SetLocalInt(OBJECT_SELF, "NW_L_DEATHEVENTFIRED",10) ;

    int nClass = GetLevelByClass(CLASS_TYPE_COMMONER);
    int nAlign = GetAlignmentGoodEvil(OBJECT_SELF);
    if(nClass > 0 && (nAlign == ALIGNMENT_GOOD || nAlign == ALIGNMENT_NEUTRAL))
    {
        object oKiller = GetLastKiller();
        AdjustAlignment(oKiller, ALIGNMENT_EVIL, 5);
    }

    SpeakString("NW_I_AM_DEAD", TALKVOLUME_SILENT_TALK);

    //Shout Attack my target, only works with the On Spawn In setup
    SpeakString("NW_ATTACK_MY_TARGET", TALKVOLUME_SILENT_TALK);

    if(GetSpawnInCondition(NW_FLAG_DEATH_EVENT))
    {
        SignalEvent(OBJECT_SELF, EventUserDefined(1007));
    }
//Upon J'nah's death, if PC was on J'nah's quest,(q5jnahsrequest)
//the journal should update to either 30 -
//if PC killed Tymofarrar as well, or 40 - if Tym is not dead.
    //object oPC = GetLastHostileActor();
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
    if (GetLocalInt(oPC, "NW_JOURNAL_ENTRYq5jnahsrequest") > 0)
    {
        if (GetLocalInt(GetModule(), "X1_TYMOFARRAR_STATUS") == 3)
            AddJournalQuestEntry("q5jnahsrequest", 30, oPC);
        else
            AddJournalQuestEntry("q5jnahsrequest", 40, oPC);
    }
    /*if (GetLocalInt(GetModule(), "X1_JNAHPLOT") == 10 && GetLocalInt(GetModule(), "X1_JNAHBETRAYPC") < 2)
        AddJournalQuestEntry("q5jnahsrequest", 40, oPC);
    else if (GetLocalInt(GetModule(), "X1_JNAHBETRAYPC") == 2)
        AddJournalQuestEntry("q5jnahsrequest", 30, oPC);
     */
    if (GetLocalInt(GetModule(), "X1_TYMOFARRAR_STATUS") == 2)
        AddJournalQuestEntry("q3tymofarrarsrevenge", 20, oPC);
    // Leave a lootable corpse that will never decay
    KillAndReplaceLootable(OBJECT_SELF, FALSE);

    //Check for a henchman interjection
    CheckForInterjection(oPC, 12);
}
void DoInterjection(object oHench, object oPC, int MOD_EVENT_NUMBER)
{
        AssignCommand(oHench, SetHasInterjection(oPC, TRUE, MOD_EVENT_NUMBER));
        AssignCommand(oHench, ClearAllActions());
        AssignCommand(oPC, ClearAllActions());
//        AssignCommand(oHench, ActionMoveToObject(oPC, TRUE, 6.0));
        AssignCommand(oHench, ActionStartConversation(oPC));
}
// * am I valid for doing an interjection
int ValidForInterjection(object oPC, object oHench)
{
    if (!IsInConversation(oPC)
        && GetDistanceBetweenLocations(GetLocation(oPC), GetLocation(oHench)) <= 20.0)
    {
        return TRUE;
    }
    return FALSE;
}
void CheckForInterjection(object oPC, int nEventNum)
{
    // * choose which henchmen gets to interject

    object oDeekin = GetObjectByTag("x0_hen_dee");
    object oDorna = GetObjectByTag("x0_hen_dor");
    object oXanos = GetObjectByTag("x0_hen_xan");
    object oHench = OBJECT_INVALID;
    object oMaster = OBJECT_INVALID;

    if (GetIsObjectValid(oDeekin))
    {
        oMaster = GetMaster(oDeekin);
        if (GetIsObjectValid(oMaster))
        {
            oHench = oDeekin;
        }
    }
    if (GetIsObjectValid(oDorna))
    {
        oMaster = GetMaster(oDorna);
        if (GetIsObjectValid(oMaster))
        {
            oHench = oDorna;
        }
    }
    if (GetIsObjectValid(oXanos))
    {
        oMaster = GetMaster(oXanos);
        if (GetIsObjectValid(oMaster))
        {
            oHench = oXanos;
        }
    }

    //SpawnScriptDebugger();
    // The key tag of the trigger is the module event number
    int MOD_EVENT_NUMBER = nEventNum;

    string sHenchTag = GetTag(oHench);
    if (ValidForInterjection(oMaster, oHench) && ValidForInterjection(oHench, oMaster))
    {
        if (GetIsInCombat(oMaster) == FALSE)
        {
            // interjections
            DoInterjection(oHench, oMaster, MOD_EVENT_NUMBER);
        }
    }
}
