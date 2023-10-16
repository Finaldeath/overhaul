//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName q1a1_ud_mischa
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Mischa will clean up a bit after the battle...
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 11/03
//:://////////////////////////////////////////////

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {

        if (GetAILevel(OBJECT_SELF) != AI_LEVEL_VERY_LOW)
        {
            //if the first cutscene is over
            if (GetLocalInt(GetModule(), "X1_CUT1RUNNING") == 2)
            {
                //and no one is talking to her... or Ayala
                if (IsInConversation(OBJECT_SELF) == FALSE && IsInConversation(GetObjectByTag("Ayala")) == FALSE && GetIsInCombat() == FALSE)
                {
                    if (GetLocalInt(OBJECT_SELF, "nUnEquipped") != 1)
                    {
                        SetLocalInt(OBJECT_SELF, "nUnEquipped", 1);
                        object oSword = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND);
                        object oShield = GetItemInSlot(INVENTORY_SLOT_LEFTHAND);
                        DestroyObject(oShield);
                        DestroyObject(oSword);
                    }
                    if (GetLocalInt(GetModule(), "Drogan_Healed") != 2)
                    {
                        SetLocalInt(OBJECT_SELF, "nHBCOUNT", GetLocalInt(OBJECT_SELF, "nHBCOUNT") + 1);

                        if (GetLocalInt(OBJECT_SELF, "nHBCOUNT") == 3)
                        {
                            if (GetLocalInt(OBJECT_SELF, "nGotJob") != 1)
                            {
                                SetLocalInt(OBJECT_SELF, "nGotJob", 1);

                                object oToClean = GetNearestObjectByTag("WeatheringScorchMark");
                                float fDistance;
                                if (GetIsObjectValid(oToClean) == TRUE && GetTag(GetArea(oToClean)) == GetTag(GetArea(OBJECT_SELF)))
                                {
                                    fDistance = GetDistanceToObject(oToClean);
                                    ActionMoveToObject(oToClean);
                                    DelayCommand(fDistance/3 + 1.0, AssignCommand(OBJECT_SELF, ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW, 1.0, 2.0)));
                                    DestroyObject(oToClean, fDistance/3 + 3.0);
                                    switch (Random(3) + 1)
                                    {
                                        case 1: DelayCommand(2.0, SpeakStringByStrRef(40381));
                                                break;
                                        case 2: DelayCommand(2.0, SpeakStringByStrRef(40382));
                                                break;
                                        case 3: DelayCommand(2.0, SpeakStringByStrRef(40383));
                                                break;

                                    }
                                }
                                else
                                {
                                    oToClean = GetNearestObjectByTag("Bloodstain");
                                    ActionMoveToObject(oToClean);
                                    DelayCommand(fDistance/3 + 1.0, AssignCommand(OBJECT_SELF, ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW, 1.0, 2.0)));
                                    DestroyObject(oToClean, fDistance/3 + 3.0);
                                    switch (Random(3) + 1)
                                    {
                                        case 1: DelayCommand(2.0, SpeakStringByStrRef(40384));
                                                break;
                                        case 2: DelayCommand(2.0, SpeakStringByStrRef(40385));
                                                break;
                                        case 3: DelayCommand(2.0, SpeakStringByStrRef(40386));
                                                break;

                                    }
                                }
                            }
                        }
                        else if (GetLocalInt(OBJECT_SELF, "nHBCOUNT") == 7)
                        {
                            object oDoor = GetObjectByTag("q1a_door_int");
                            if (GetIsOpen(oDoor) == TRUE)
                            {
                                ActionCloseDoor(oDoor);
                                DelayCommand(2.0, SpeakStringByStrRef(40389));
                            }
                        }
                        else if (GetLocalInt(OBJECT_SELF, "nHBCOUNT") == 10)
                        {
                            ActionMoveToObject(GetWaypointByTag("wp_mischa_post"), FALSE);
                            DelayCommand(10.0, SetFacingPoint(GetPosition(GetObjectByTag("Drogan"))));
                            SetLocalInt(OBJECT_SELF, "nHBCOUNT", 0);
                            SetLocalInt(OBJECT_SELF, "nGotJob", 0);
                        }
                    }
                }
            }
        }
    }
    else if(nUser == 1002) // PERCEIVE
    {

    }
    else if(nUser == 1003) // END OF COMBAT
    {

    }
    else if(nUser == 1004) // ON DIALOGUE
    {

    }
    else if(nUser == 1005) // ATTACKED
    {

    }
    else if(nUser == 1006) // DAMAGED
    {

    }
    else if(nUser == 1007) // DEATH
    {

    }
    else if(nUser == 1008) // DISTURBED
    {

    }

}

