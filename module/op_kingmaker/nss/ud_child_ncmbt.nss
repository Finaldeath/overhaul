//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Two components
     a) Hear a shout, respond
     b) send shouts every second
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
// updated fromud_noncomantant

#include "x2_am_inc"
void debugit(string s)
{
//    if (GetTag(OBJECT_SELF) == "townchicken")
 //    if (GetTag(OBJECT_SELF) == "towndogchik")
 //     SpeakString(s);
}
//spawns an angry magic sword
void PunishPlayer(object oPC);
void ForceConv(object oSpeaker, object oListener);
void NeutralizeArea(object oSource, float fRadius);

void main()
{
    float  nSendEvents = 1.0;
    object oTarget;

    if (NoPlayerInArea() == TRUE)
    {
        nSendEvents = 100.0;
    }

    //debugit(IntToString(GetCurrentAction(OBJECT_SELF)));
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1004) // ON DIALOGUE
    {

       //debugit("heard some dialog");
        int nListeningPattern = GetListenPatternNumber();
        //SpeakString("I heard");
        if (GetJob() == JOB_TAG_IT)
        {
            //debugit("think I'm it");
            // * move towards shouter
            if (nListeningPattern == LISTEN_IAMNOTIT)
            {
               //debugit("Heard someone who is not it");
               if (GetCurrentAction(OBJECT_SELF) != ACTION_MOVETOPOINT)
               {
                object oShouter = GetLastSpeaker();
                object oNearest = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_NOT_PC);
                // * always move to closest creature
                if (oShouter != oNearest)
                {
                    if (GetJob(oNearest) == JOB_TAG_NOTIT)
                        oShouter = oNearest;
                }
              //  SpeakString("move to " + GetName(oShouter));

               // * caused chugging and freezing
                DelayCommand(nSendEvents, SignalEvent(OBJECT_SELF, EventUserDefined(EVENT_IT_SHOUTS)));
                ActionMoveToObject(oShouter, TRUE, 1.3);
                }
            }
        }
        else
        if (nListeningPattern ==  LISTEN_SOMEONEISIT)
        {
         //debugit("heard the SomeoneIsIt");
            object oIt = GetLastSpeaker();
            if (GetCurrentAction(OBJECT_SELF) != ACTION_MOVETOPOINT)
            {
               // ClearAllActions(); Causes them to move out of bounding region
                ActionMoveAwayFromObject(oIt, TRUE, 10.0);
            }
        }
        //else
        //    debugit(IntToString(nListeningPattern));
    }
    else
    // * I shout that I am it, tell me to shout again
    if (nUser == EVENT_IT_SHOUTS)
    {
        // * should ever second
        if (GetJob() == JOB_TAG_IT)
        {
        //debugit("it");
        //    SpeakString("shooting  it");
            SpeakString("IAMIT", TALKVOLUME_SILENT_TALK);
            event eShout = EventUserDefined(EVENT_IT_SHOUTS);
            object oSelf = OBJECT_SELF;
           // DelayCommand(1.0, SignalEvent(oSelf, eShout));

                        // * shout that I am it and chase nearest child
            // * if I am within 1.0 meters of them they are it
            object oChild = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_NOT_PC);
            if (GetIsObjectValid(oChild) == TRUE)
            {
                if (GetJob(oChild) == JOB_TAG_NOTIT)
                {
                    // * can only tag someone who is close enough
                    // * and is allowed to be tagged
                    if (GetDistanceToObject(oChild) <= 1.0 && GetLocalInt(oChild, "X2_G_NEVERIT") == 0)
                    {
                        //ClearAllActions();
                        SpeakString("ut: You're It!", TALKVOLUME_SILENT_TALK);
                        ActionSpeakStringByStrRef(3789);
                        SetJob(JOB_TAG_NOTIT);
                        SetJob(JOB_TAG_IT, oChild);
                        DelayCommand(nSendEvents, SignalEvent(oChild, EventUserDefined(EVENT_IT_SHOUTS)));
                        DelayCommand(nSendEvents, SignalEvent(OBJECT_SELF, EventUserDefined(EVENT_NOTIT_SHOUTS)));
                        ClearAllActions(); // * this clear is VERY important, else they seem to get stuck in place
                        ActionMoveAwayFromObject(oChild, TRUE, 10.0);
                    }
                }
           }

        }
    }
    // * I shout that I am not it
    else
    if (nUser == EVENT_NOTIT_SHOUTS)
    {
        if (GetJob(OBJECT_SELF) == JOB_TAG_NOTIT)
        {
        // SpeakString("shooting not it");
        //debugit("not it");
         SpeakString("IAMnotIT", TALKVOLUME_SILENT_TALK);
         event eShout = EventUserDefined(EVENT_NOTIT_SHOUTS);
         object oSelf = OBJECT_SELF;
         DelayCommand(nSendEvents, SignalEvent(oSelf, eShout));
        }
    }

    if(nUser == EVENT_ATTACKED) // ATTACKED
    {
        oTarget = GetLastAttacker();
        AssignCommand(GetModule(), PunishPlayer(oTarget));
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

