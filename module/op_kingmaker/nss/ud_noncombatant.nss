//::///////////////////////////////////////////////
//:: Name ud_noncomantant
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    UserDefined script for punishing naughty player who pick on
    noncomabatants in the keep of cyan
*/
//:://////////////////////////////////////////////
//:: Created By: Keith K2 Hayward
//:: Created On: June 2004
//:://////////////////////////////////////////////

const int EVENT_USER_DEFINED_PRESPAWN = 1510;
const int EVENT_USER_DEFINED_POSTSPAWN = 1511;

//spawns an angry magic sword
void PunishPlayer(object oPC);
void ForceConv(object oSpeaker, object oListener);
void NeutralizeArea(object oSource, float fRadius);

void main()
{
    int nUser = GetUserDefinedEventNumber();
    object oTarget;
//    SpeakString("Event Called ("
//        + IntToString(nUser) + " - " + IntToString(EVENT_ATTACKED) + ")");

    if(nUser == EVENT_HEARTBEAT ) //HEARTBEAT
    {

    }
    else if(nUser == EVENT_PERCEIVE) // PERCEIVE
    {

    }
    else if(nUser == EVENT_END_COMBAT_ROUND) // END OF COMBAT
    {

    }
    else if(nUser == EVENT_DIALOGUE) // ON DIALOGUE
    {

    }
    else if(nUser == EVENT_ATTACKED) // ATTACKED
    {
        oTarget = GetLastAttacker();
        AssignCommand(GetModule(), PunishPlayer(oTarget));
    }
    else if(nUser == EVENT_DAMAGED) // DAMAGED
    {

    }
    else if(nUser == 1007) // DEATH  - do not use for critical code, does not fire reliably all the time
    {

    }
    else if(nUser == EVENT_DISTURBED) // DISTURBED
    {

    }
    else if (nUser == EVENT_USER_DEFINED_PRESPAWN)
    {

    }
    else if (nUser == EVENT_USER_DEFINED_POSTSPAWN)
    {

    }
}

void PunishPlayer(object oPC)
{
    if (GetIsPossessedFamiliar(oPC) == TRUE)
    {
        UnpossessFamiliar(oPC);
        oPC = GetMaster(oPC);
    }

    if(GetIsPC(oPC) == TRUE)
    {
        location lPC = GetLocation(oPC);
        effect eParalyze = EffectCutsceneParalyze();
        object oMW = CreateObject(OBJECT_TYPE_PLACEABLE, "km_deathlight",lPC);

        AssignCommand(oPC, ClearAllActions(TRUE));
        SetCommandable(FALSE, oPC);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eParalyze, oPC);

        NeutralizeArea(oPC, 60.0f);
        SetStandardFactionReputation(STANDARD_FACTION_COMMONER, 80, oPC);
        SetStandardFactionReputation(STANDARD_FACTION_MERCHANT, 80, oPC);
        SetStandardFactionReputation(STANDARD_FACTION_DEFENDER, 80, oPC);

        DelayCommand(1.0, ForceConv(oMW, oPC));
    }
}

void ForceConv(object oSpeaker, object oListener)
{
    if (GetIsInCombat(oListener) == TRUE)
    {
        AssignCommand(oListener, ClearAllActions(TRUE));
        NeutralizeArea(oListener, 60.0f);
        DelayCommand(1.0, ForceConv(oSpeaker, oListener));
    }

    if (IsInConversation(oListener) == FALSE)
    {
        AssignCommand(oListener, ClearAllActions(TRUE));
        AssignCommand(oSpeaker, ActionStartConversation(oListener));
        DelayCommand(1.0, ForceConv(oSpeaker, oListener));
    }
}

void NeutralizeArea(object oSource, float fRadius)
{
    location lSource = GetLocation(oSource);
    object oTarget = GetFirstObjectInArea(GetArea(oSource));

    while(oTarget != OBJECT_INVALID)
    {
        if(GetObjectType(oTarget) == OBJECT_TYPE_CREATURE)
        {
            AssignCommand(oTarget, ClearAllActions(TRUE));
            AssignCommand(oTarget, SurrenderToEnemies());
            ClearPersonalReputation(oTarget, oSource);
            AdjustReputation(oTarget, oSource, 100);
            SetIsTemporaryNeutral(oTarget, oSource);
        }

        //PrintString("ClearRep - " + GetName(oTarget));
        oTarget = GetNextObjectInArea(GetArea(oSource));
    }

    object oCal = GetNearestObjectByTag("os_hen_cal", oSource);
    DestroyObject(oCal);
    object oJab = GetNearestObjectByTag("os_hen_jab", oSource);
    DestroyObject(oJab);
    object oTrp = GetNearestObjectByTag("os_hen_trp", oSource);
    DestroyObject(oTrp);
    object oKai = GetNearestObjectByTag("os_hen_kai", oSource);
    DestroyObject(oKai);

    //PrintString("Destroyed henchmen");

    oTarget = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oSource);
    DestroyObject(oTarget);
    oTarget = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oSource);
    DestroyObject(oTarget);
    oTarget = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oSource);
    DestroyObject(oTarget);
}

