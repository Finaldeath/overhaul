//::///////////////////////////////////////////////
//:: gong user-defined
//:: q3a_gong_ud
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Whenever the gong is activated:
    1. Change alarm status in area to 1 (activated)
    2. Call all gnolls that are not sentries in radius ALARM_RADIUS to the gong
    3. Send event 101 to all sentries (increase listen)
*/
//:://////////////////////////////////////////////
//:: Created By: Yaron
//:: Created On: 25/2/2003
//:://////////////////////////////////////////////


float ALARM_RADIUS = 50.0;

int GetIsInTrigger(object oTrigger, object oCreature);
void SetAmbushes()
{
    int nDoOnce = GetLocalInt(GetArea(OBJECT_SELF), "DO_SET_AMBUSHES_ONCE");
    if(nDoOnce == 1)
         return;
    SetLocalInt(GetArea(OBJECT_SELF), "DO_SET_AMBUSHES_ONCE", 1);

    object oAmbushRoom1 = GetObjectByTag("q3a_ambushroom_1");
    object oAmbushRoom2 = GetObjectByTag("q3a_ambushroom_2");
    int nPCINROOM = FALSE;
    object oPC = GetFirstPC();
    while (oPC != OBJECT_INVALID)
    {
        if (GetIsInTrigger(oAmbushRoom1, oPC) == TRUE || GetIsInTrigger(oAmbushRoom2, oPC) == TRUE)
            nPCINROOM = TRUE;
        oPC = GetNextPC();
    }
    int n;
    for(n = 1; n <= 4; n++)
    {
        object oDoor = GetNearestObjectByTag("Q3_GNOLL_AMBUSH_DOOR", OBJECT_SELF, n);
        object oWP = GetNearestObjectByTag("Q3A_WP_AMBUSH", OBJECT_SELF, n);
        if(oDoor == OBJECT_INVALID || oWP == OBJECT_INVALID)
            return;
        AssignCommand(oDoor, ActionCloseDoor(oDoor));
        if (nPCINROOM == FALSE)
        {
            //SetLocked(oDoor, TRUE);
            CreateObject(OBJECT_TYPE_CREATURE, "q3_gnoll_ambushe", GetLocation(oWP));
            CreateObject(OBJECT_TYPE_CREATURE, "q3_gnoll_ambushe", GetLocation(oWP));
        }
    }
}

void main()
{
    int nEvent = GetUserDefinedEventNumber();
    if(nEvent == 101)
    {
        PlaySound("as_cv_gongring2");
        SetLocalInt(GetArea(OBJECT_SELF), "Q3_ALARM_STATUS", 1);
        SetAmbushes();
        int n = 1;
        object oGnoll = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, OBJECT_SELF, n);
        //UPDATE - TRY SENDING GNOLLS TO THE GONG THAT SOUNDED RATHER THAN THE PC
        object oPC = OBJECT_SELF;//GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
        float fDelay = 0.0;
        while(oGnoll != OBJECT_INVALID)
        {
            float fDistance = GetDistanceBetween(OBJECT_SELF, oGnoll);
            if(fDistance > ALARM_RADIUS)
                return;
            n++;
            string sTag = GetTag(oGnoll);
            // only creatures starting with "Q3_GNOLL" are called to the alarm
            if(GetStringLeft(sTag, 8) == "Q3_GNOLL")
            {
                int nSentinel = GetLocalInt(oGnoll, "Q3_SENTINEL");
                if(nSentinel != 1) // not a sentinel
                {
                    if(fDistance > 10.0 && !GetIsInCombat(oGnoll)) // alarm only far-away gnolls
                    {
                        fDelay += 1.0;
                        object oWP = GetNearestObjectByTag("Q3A_WP_MIDDLE", oPC); // first - get a mid-way to pc
                        object oWP2 = GetNearestObjectByTag("Q3A_WP_OUT_OF_ROOM", oGnoll); // first - get out of room
                        float fDistanceToWP = GetDistanceBetween(oGnoll, oWP);
                        float fDistanceToPC = GetDistanceBetween(oGnoll, oPC);
                        float fDistanceToWP2 = GetDistanceBetween(oGnoll, oWP2);

                        DelayCommand(fDelay, AssignCommand(oGnoll, ClearAllActions()));
                        if(fDistanceToWP2 < fDistanceToPC)
                            DelayCommand(fDelay, AssignCommand(oGnoll, ActionForceMoveToObject(oWP2, TRUE)));
                        if(fDistanceToWP < fDistanceToPC)
                            DelayCommand(fDelay, AssignCommand(oGnoll, ActionForceMoveToObject(oWP, TRUE)));

                        DelayCommand(fDelay, AssignCommand(oGnoll, ActionMoveToObject(oPC, TRUE)));

                    }
                }
                else // a sentinel
                {
                    SignalEvent(oGnoll, EventUserDefined(101));
                }
            }
            SetLocalInt(oGnoll, "Q3_ALARMED_GNOLL", 1); // marking this gnoll as alarmed, so he won't activate the alarm again
            //SpeakString("GOT ONE!");
            oGnoll = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, OBJECT_SELF, n);

        }

    }
}
int GetIsInTrigger(object oTrigger, object oCreature)
{
    object oTest = GetFirstInPersistentObject(oTrigger);
    while (oTest != OBJECT_INVALID)
    {
        if (GetName(oCreature) == GetName(oTest))
            return TRUE;
        oTest = GetNextInPersistentObject(oTrigger);
    }
    return FALSE;
}
