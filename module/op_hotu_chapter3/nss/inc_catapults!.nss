//::///////////////////////////////////////////////
//:: Catapults!: Master Include File
//:: Inc_Catapults!.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////



//::///////////////////////////////////////////////
//:: RandomLocation
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns a random location within the
     boundaries defined by two Corner Designator
     waypoints.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 6, 2002
//:://////////////////////////////////////////////

location RandomLocation()
{
    int bLocationValid = FALSE;

    while (bLocationValid == FALSE)
    {
        //Determine the spawn boundary using the Corner Designator waypoints.
        object oCorner1 = GetObjectByTag("CornerDesignator", 0);
        object oCorner2 = GetObjectByTag("CornerDesignator", 1);
        vector vCorner1 = GetPosition(oCorner1);
        vector vCorner2 = GetPosition(oCorner2);
        int iCorner1_X = FloatToInt(vCorner1.x);
        int iCorner1_Y = FloatToInt(vCorner1.y);
        int iCorner2_X = FloatToInt(vCorner2.x);
        int iCorner2_Y = FloatToInt(vCorner2.y);
        float fNew_X;
        float fNew_Y;

        //Define random X & Y coordinates within the defined spawn boundary.
        if (iCorner1_X > iCorner2_X)
        {
            fNew_X = IntToFloat(Random(iCorner1_X - iCorner2_X) + iCorner2_X);
        }
        else
        {
            fNew_X = IntToFloat(Random(iCorner2_X - iCorner1_X) + iCorner1_X);
        }

        if (iCorner1_Y > iCorner2_Y)
        {
            fNew_Y = IntToFloat(Random(iCorner1_Y - iCorner2_Y) + iCorner2_Y);
        }
        else
        {
            fNew_Y = IntToFloat(Random(iCorner2_Y - iCorner1_Y) + iCorner1_Y);
        }

        //Compile the new location.
        object oArea = GetArea(oCorner1);
        vector vNew = Vector(fNew_X, fNew_Y);
        float fNew_Orientation = IntToFloat(Random(360)+1);
        location lNew = Location(oArea, vNew, fNew_Orientation);

        //Check the location to make sure it's not already occupied.
        object oValidation = GetFirstObjectInShape(SHAPE_SPHERE, 2.0, lNew);
        if (oValidation == OBJECT_INVALID)
        {
            bLocationValid = TRUE;
            //Return the validated location
            return lNew;
        }
    }

    //If there's an error, return the caller's location.
    return GetLocation(OBJECT_SELF);
}


//::///////////////////////////////////////////////
//:: Blast
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Parses any valid targets within a Blast
     impact and saves them out as Local Objects
     which are then handled by the ProcessBlast()
     function below.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 6, 2002
//:://////////////////////////////////////////////

void Blast(object oTarget, object oImpactOwner)
{
    string sTarget = GetTag(oTarget);

    //If they hit a Power-Up Creature or Catapult, save them out as objects.
    if (sTarget == "PARALYZER" ||
        sTarget == "SCRAMBLER" ||
        sTarget == "BLASTER"   ||
        sTarget == "PROTECTOR" ||
        sTarget == "IMPLODER"  ||
        sTarget == "SEEKER"    ||
        sTarget == "Catapult")
    {
        int iBlastNth = GetLocalInt(oImpactOwner, "iBlastNth");
        iBlastNth++;
        SetLocalInt(oImpactOwner, "iBlastNth", iBlastNth);
        SetLocalObject(oImpactOwner, "oBlastTarget_"+IntToString(iBlastNth), oTarget);
    }
}


//::///////////////////////////////////////////////
//:: ProcessBlast
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Processes any Local Objects saved out in the
     Blast() function.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 6, 2002
//:://////////////////////////////////////////////

void ProcessBlast(object oImpactOwner)
{
    int iNth = 1;
    int iBlastNth = GetLocalInt(oImpactOwner, "iBlastNth");

    while (iNth <= iBlastNth)
    {
        object oTarget = GetLocalObject(oImpactOwner, "oBlastTarget_"+IntToString(iNth));
        string sTarget = GetTag(oTarget);

        //Ensure that the target is not currently PROTECTED
        int bProtected = GetLocalInt(oTarget, "bProtected");
        if (bProtected == FALSE)
        {
            //If they hit a Power-Up Creature signal its User-Defined Event and
            //declare its Activator.
            if (sTarget == "PARALYZER" ||
                sTarget == "SCRAMBLER" ||
                sTarget == "BLASTER"   ||
                sTarget == "PROTECTOR" ||
                sTarget == "IMPLODER"  ||
                sTarget == "SEEKER")
            {
                SetLocalObject(oTarget, "oActivator", oImpactOwner);
                SignalEvent(oTarget, EventUserDefined(1));
            }

            //If they hit a working catapult...
            if (sTarget == "Catapult")
            {
                //Get the necessary info, then destroy the catapult.
                object oCatapultOwner = GetLocalObject(oTarget, "oOwner");
                location lCatapult = GetLocation(oTarget);
                DestroyObject(oTarget);

                //Increment the ImpactOwner's Kills score.
                int iKills = GetLocalInt(oImpactOwner, "iKills");
                if (oCatapultOwner == oImpactOwner)
                {
                    iKills--;
                    ActionDoCommand(PlayVoiceChat(VOICE_CHAT_CUSS, oImpactOwner));
                }
                else
                {
                    iKills++;
                    ActionDoCommand(PlayVoiceChat(VOICE_CHAT_CHEER, oImpactOwner));
                }
                SetLocalInt(oImpactOwner, "iKills", iKills);

                //Reward them.
                ActionDoCommand(GiveXPToCreature(oImpactOwner, 100));

                //If the ImpactOwner's score is higher than the match setting,
                //declare them a victor.
                object oSiegeMaster = GetNearestObjectByTag("SiegeMaster");
                int iMatch = GetLocalInt(oSiegeMaster, "iMatch");

                if (iKills >= iMatch && iMatch != 999)
                {
                    //Have the SiegeMaster announce the victor.
                    string sVictor = GetName(oImpactOwner);
                    //AssignCommand(oSiegeMaster, SpeakString(sVictor+" wins this match! A new match has now begun... [NOT IN STRING EDITOR]", TALKVOLUME_SHOUT));

                    //Increment the victor's Match Wins.
                    int iMatchWins = GetLocalInt(oImpactOwner, "iMatchWins");
                    iMatchWins++;
                    SetLocalInt(oImpactOwner, "iMatchWins", iMatchWins);

                    //Clear everyone's score.
                    object oPC = GetFirstPC();

                    while (oPC != OBJECT_INVALID)
                    {
                        SetLocalInt(oPC, "iKills", 0);
                        oPC = GetNextPC();
                    }

                    //Award bonus XP to the vicotr (equal to 10 times the match
                    //setting).
                    ActionDoCommand(GiveXPToCreature(oImpactOwner, iMatch*10));
                }

                //Spawn in a new catapult at a random location and jump the
                //player to it.
                location lNew = RandomLocation();
                object oNewCatapult = CreateObject(OBJECT_TYPE_PLACEABLE, "Catapult", lNew);
                AssignCommand(oCatapultOwner, JumpToLocation(lNew));

                //Designate the player as owner of that catapult.
                SetLocalObject(oNewCatapult, "oOwner", oCatapultOwner);
                SetLocalObject(oCatapultOwner, "oCatapult", oNewCatapult);

                //Make the catapult relaunch its conversation with the player.
                AssignCommand(oNewCatapult, ActionStartConversation(oCatapultOwner, "", TRUE));

                //Reset their default range
                SetLocalInt(oCatapultOwner, "bDefaultRange", FALSE);
            }
        }
        //Clear the object from memory and increment iNth to check for the next object.
        SetLocalObject(oImpactOwner, "oBlastTarget_"+IntToString(iNth), OBJECT_INVALID);
        iNth++;
    }
    //When the loop is complete, clear the iBlastNth value.
    SetLocalInt(oImpactOwner, "iBlastNth", 0);
}


//::///////////////////////////////////////////////
//:: Implode
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Parses any valid targets within a Implode
     impact and saves them out as Local Objects
     which are then handled by the
     ProcessImplode() function below.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 6, 2002
//:://////////////////////////////////////////////

void Implode(object oTarget, object oImpactOwner)
{
    string sTarget = GetTag(oTarget);

    //If they hit a Power-Up Creature or Catapult, save them out as objects.
    if (sTarget == "PARALYZER" ||
        sTarget == "SCRAMBLER" ||
        sTarget == "BLASTER"   ||
        sTarget == "PROTECTOR" ||
        sTarget == "IMPLODER"  ||
        sTarget == "SEEKER"    ||
        sTarget == "Catapult")
    {
        int iImplodeNth = GetLocalInt(oImpactOwner, "iImplodeNth");
        iImplodeNth++;
        SetLocalInt(oImpactOwner, "iImplodeNth", iImplodeNth);
        SetLocalObject(oImpactOwner, "oImplodeTarget_"+IntToString(iImplodeNth), oTarget);
    }
}


//::///////////////////////////////////////////////
//:: ProcessImplode
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Processes any Local Objects saved out in the
     Implode() function.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 6, 2002
//:://////////////////////////////////////////////

void ProcessImplode(object oImpactOwner, location lImplosion)
{
    int iNth = 1;
    int iImplodeNth = GetLocalInt(oImpactOwner, "iImplodeNth");

    while (iNth <= iImplodeNth)
    {
        object oTarget = GetLocalObject(oImpactOwner, "oImplodeTarget_"+IntToString(iNth));
        string sTarget = GetTag(oTarget);

        //Ensure that the target is not currently PROTECTED
        int bProtected = GetLocalInt(oTarget, "bProtected");
        if (bProtected == FALSE)
        {
            //If the Implosion hits a Power-Up Creature, jump it to the center of the
            //Implosion.
            if (sTarget == "PARALYZER" ||
                sTarget == "SCRAMBLER" ||
                sTarget == "BLASTER"   ||
                sTarget == "PROTECTOR" ||
                sTarget == "IMPLODER"  ||
                sTarget == "SEEKER")
            {
                AssignCommand(oTarget, ActionJumpToLocation(lImplosion));
            }

            //If they hit a Catapult, jump it and its Owner to the center of the
            //Implosion.
            if (sTarget == "Catapult")
            {
                object oOwner = GetLocalObject(oTarget, "oOwner");
                DestroyObject(oTarget);
                object oCatapult = CreateObject(OBJECT_TYPE_PLACEABLE, "Catapult", lImplosion);
                AssignCommand(oOwner, ActionJumpToLocation(lImplosion));

                //Reassign Ownership.
                SetLocalObject(oCatapult, "oOwner", oOwner);
                SetLocalObject(oOwner, "oCatapult", oCatapult);

                //Make the catapult relaunch its conversation with the player.
                AssignCommand(oCatapult, ActionStartConversation(oOwner, "", TRUE));
            }
        }
        //Clear the object from memory and increment iNth to check for the next object.
        SetLocalObject(oImpactOwner, "oImplodeTarget_"+IntToString(iNth), OBJECT_INVALID);
        iNth++;
    }
    //When the loop is complete, clear the iBlastNth value.
    SetLocalInt(oImpactOwner, "iImplodeNth", 0);
}


//::///////////////////////////////////////////////
//:: Paralyze
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Parses any valid targets within a Paralyze
     impact and saves them out as Local Objects
     which are then handled by the
     ProcessParalyze() function below.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 6, 2002
//:://////////////////////////////////////////////

void Paralyze(object oTarget, object oImpactOwner)
{
    string sTarget = GetTag(oTarget);

    //If they hit a Power-Up Creature or Catapult, save them out as objects.
    if (sTarget == "PARALYZER" ||
        sTarget == "SCRAMBLER" ||
        sTarget == "BLASTER"   ||
        sTarget == "PROTECTOR" ||
        sTarget == "IMPLODER"  ||
        sTarget == "SEEKER"    ||
        sTarget == "Catapult")
    {
        int iParalyzeNth = GetLocalInt(oImpactOwner, "iParalyzeNth");
        iParalyzeNth++;
        SetLocalInt(oImpactOwner, "iParalyzeNth", iParalyzeNth);
        SetLocalObject(oImpactOwner, "oParalyzeTarget_"+IntToString(iParalyzeNth), oTarget);
    }
}


//::///////////////////////////////////////////////
//:: ProcessParalyze
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Processes any Local Objects saved out in the
     Paralyze() function.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 6, 2002
//:://////////////////////////////////////////////

void ProcessParalyze(object oImpactOwner)
{
    int iNth = 1;
    int iParalyzeNth = GetLocalInt(oImpactOwner, "iParalyzeNth");

    while (iNth <= iParalyzeNth)
    {
        object oTarget = GetLocalObject(oImpactOwner, "oParalyzeTarget_"+IntToString(iNth));
        string sTarget = GetTag(oTarget);

        //Ensure that the target is not currently PROTECTED and is not the ImpactOwner.
        int bProtected = GetLocalInt(oTarget, "bProtected");
        if (bProtected == FALSE && oTarget != oImpactOwner)
        {
            //If the impact hits a Power-Up...
            if (sTarget == "PARALYZER" ||
                sTarget == "SCRAMBLER" ||
                sTarget == "BLASTER"   ||
                sTarget == "PROTECTOR" ||
                sTarget == "IMPLODER"  ||
                sTarget == "SEEKER")
            {
                //Temporarily Paralyze it.
                effect eParalyze = EffectParalyze();
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eParalyze, oTarget, 20.0);
            }

            if (sTarget == "Catapult")
            {
                //Destroy the catapult to kick the player out of conversation with it.
                location lTarget = GetLocation(oTarget);
                object oOwner = GetLocalObject(oTarget, "oOwner");
                DestroyObject(oTarget);
                object oCatapult = CreateObject(OBJECT_TYPE_PLACEABLE, "catapult", lTarget);

                //Re-designate the player as owner of that catapult.
                SetLocalObject(oCatapult, "oOwner", oOwner);
                SetLocalObject(oOwner, "oCatapult", oCatapult);

                //Make the catapult relaunch its conversation with the player.
                AssignCommand(oCatapult, ActionStartConversation(oOwner, "", TRUE));

                //Set its "Paralyzed" flag to TRUE. This should prevent its owner from
                //controlling it in conversation.
                SetLocalInt(oTarget, "bParalyzed", TRUE);
                DelayCommand(20.0, SetLocalInt(oTarget, "bParalyzed", FALSE));
            }
        }
        //Clear the object from memory and increment iNth to check for the next object.
        SetLocalObject(oImpactOwner, "oParalyzeTarget_"+IntToString(iNth), OBJECT_INVALID);
        iNth++;
    }
    //When the loop is complete, clear the iBlastNth value.
    SetLocalInt(oImpactOwner, "iParalyzeNth", 0);
}


//::///////////////////////////////////////////////
//:: Scramble
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Handles the behavior of any valid targets
     within a Scramble impact (SCRAMBLER).
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 6, 2002
//:://////////////////////////////////////////////

void Scramble(object oTarget)
{
    string sTarget = GetTag(oTarget);

    //Ensure that the target is not currently PROTECTED
    int bProtected = GetLocalInt(oTarget, "bProtected");
    if (bProtected == FALSE)
    {
        //If SCRAMBLER hits a catapult...
        if (sTarget == "Catapult")
        {
            //Set its Orientation & Range to random values.
            object oOwner = GetLocalObject(oTarget, "oOwner");
            float fOrientation = IntToFloat(Random(360)+1);
            int iRange = Random(27)+3;
            AssignCommand(oTarget, SetFacing(fOrientation));
            SetLocalInt(oOwner, "iRange", iRange);
        }
    }
}

//::///////////////////////////////////////////////
//:: HandleImpactTargets
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Handles the behavior of any valid targets
     within the impact radius.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 6, 2002
//:://////////////////////////////////////////////

void HandleImpactTargets(location lImpact, float fRadius, object oImpactOwner, string sImpactType)
{
    //Calculate the timing delay.
    int iRange = GetLocalInt(oImpactOwner, "iRange");
    float fImpactDelay = IntToFloat(iRange)/12;

    //Parse the impact radius for catapults & POWER-UP creatures...
    object oTarget = GetFirstObjectInShape(SHAPE_SPHERE, fRadius, lImpact, FALSE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_PLACEABLE);

    while (oTarget != OBJECT_INVALID)
    {
        //If hit by a Blast (Catapult, BLASTER, or SEEKER)...
        if (sImpactType == "Blast")
        {
            DelayCommand(fImpactDelay, Blast(oTarget, oImpactOwner));
            //The Blast() only saves the targets out as local objects. The
            //actual destruction and processing of those objects must be
            //handled from outside of the GetFirst/GetNext loop. See
            //ProcessBlast() below.
        }

        //If hit by an Imploder...
        if (sImpactType == "Implode")
        {
            DelayCommand(fImpactDelay, Implode(oTarget, oImpactOwner));
            //The Implode() only saves the targets out as local objects. The
            //actual destruction and processing of those objects must be
            //handled from outside of the GetFirst/GetNext loop. See
            //ProcessImplode() below.
        }

        //If hit by Paralyzer...
        if (sImpactType == "Paralyze")
        {
            DelayCommand(fImpactDelay, Paralyze(oTarget, oImpactOwner));
            //The Paralyze() only saves the targets out as local objects. The
            //actual destruction and processing of those objects must be
            //handled from outside of the GetFirst/GetNext loop. See
            //ProcessParalyze() below.
        }

        //If hit by Scrambler...
        if (sImpactType == "Scramble")
        {
            DelayCommand(fImpactDelay, Scramble(oTarget));
        }
        oTarget = GetNextObjectInShape(SHAPE_SPHERE, fRadius, lImpact, FALSE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_PLACEABLE);
    }
    DelayCommand(fImpactDelay, ProcessBlast(oImpactOwner));
    DelayCommand(fImpactDelay, ProcessImplode(oImpactOwner, lImpact));
    DelayCommand(fImpactDelay, ProcessParalyze(oImpactOwner));
}


//::///////////////////////////////////////////////
//:: CheckMatchVote
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Tallies the current Match Setting votes and
     returns TRUE if over 50% have voted for
     iMatch.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 15, 2002
//:://////////////////////////////////////////////

int CheckMatchVote(int iMatch)
{
    object oPC = GetFirstPC();
    int iTotalPCs;
    int iTotalVotes;

    //Parse the votes of all PCs
    while (oPC != OBJECT_INVALID)
    {
        iTotalPCs++;

        int iVote = GetLocalInt(oPC, "iMatch");
        if (iVote == iMatch)
        {
            iTotalVotes++;
        }
        oPC = GetNextPC();
    }

    //Return TRUE if the vote exceeds 50%.
    if (iTotalVotes > iTotalPCs/2)
    {
        return TRUE;
    }
    return FALSE;
}


//::///////////////////////////////////////////////
//:: CheckPowerUpVote
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Tallies the current Power-Up votes for the
     given Power-Up and returns TRUE if over 50%
     agree it should be "On" or "Off".
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On:August 7, 2002
//:://////////////////////////////////////////////

int CheckPowerUpVote(string sPowerUp, string sOnOff)
{
    object oPC = GetFirstPC();
    int iTotalPCs;
    int iTotalVotes;

    //Parse the votes of all PCs
    while (oPC != OBJECT_INVALID)
    {
        iTotalPCs++;

        string sVote = GetLocalString(oPC, sPowerUp);
        if (sVote == sOnOff)
        {
            iTotalVotes++;
        }
        oPC = GetNextPC();
    }

    //Return TRUE if the vote exceeds 50%.
    if (iTotalVotes > iTotalPCs/2)
    {
        return TRUE;
    }
    return FALSE;
}
