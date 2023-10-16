//::///////////////////////////////////////////////
//:: Secret Door invis object
//:: V 1.6
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

    MODIFIED RAT DOOR - CAN ONLY BE DETECTED WHEN THE
    RAT IS WITHIN 10 METERS OF THE DOOR   (RAT 'q2b02rat')

    This Invisable object will do a check and see
    if any pc comes within a radius of this object.

    If the PC has the search skill or is a elf then
    a search check will be made.

    It will create a trap door that will have its
    Destination set to a waypoint that has
    a tag of DST_<tag of this object>

    The radius is determined by the reflex saving
    throw of the invisible object

    The DC of the search stored by the willpower
    saving throw.

*/
//:://////////////////////////////////////////////
//:: Created By  : Robert Babiak
//:: Created On  : June 25, 2002
//::---------------------------------------------
//:: Modifyed By : Robert Babiak
//:: Modifyed On : July 24, 2002
//:: Modification: Changed the name of the blueprint
//:: used to create a wall door instead, and also
//:: incorporated a optimization to reduce CPU usage.
//::---------------------------------------------
//:: Modifyed By : Robert Babiak
//:: Modifyed On : July 25, 2002
//:: fixed problem with the aborting of the search
//:: for PC that where in the search radius.
//:: it was aborting when it got found a PC that
//:: outside the search distance, but this also
//:: canceled the search check.
//::
//:: This will teach me to trust code mailed in
//:: from users...:)
//::---------------------------------------------
//:: Modified By : Andrew Nobbs
//:: Modified On : September 23, 2002
//:: Modification: Just removed all the extra spaces,
//:: they were unnecessary.
//::
//:: Modified By : Keith Warner
//:: Modified On : September 25, 2002
//:: Added: Message to PC that secret door has been found
//:: Added second door at the destination waypoint so that PCs can
//:: go back through the door.  Second door is created at Waypoint 'DOOR2' + original tag
//:: Return Destination is set to waypoint 'RET' + original tag

//:://////////////////////////////////////////////

void main()
{
    float fRatDistance;
    object oRat = GetObjectByTag("q2b08rat");
    object oSecret = GetObjectByTag("q2b08ratdoor");

    if (oRat != OBJECT_INVALID)
    {

        if (GetDistanceBetween(oRat, oSecret) < 12.5f)
        {

            // get the radius and DC of the secret door.
            float fSearchDist = IntToFloat(GetReflexSavingThrow(OBJECT_SELF));
            int nDiffaculty = GetWillSavingThrow(OBJECT_SELF);

            // what is the tag of this object used in setting the destination
            string sTag = GetTag(OBJECT_SELF);

            // has it been found?
            int nDone = GetLocalInt(OBJECT_SELF,"D_"+sTag);
            int nReset = GetLocalInt(OBJECT_SELF,"Reset");

            // ok reset the door is destroyed, and the done and reset flas are made 0 again
            if (nReset == 1)
            {
                nDone = 0;
                nReset = 0;

                SetLocalInt(OBJECT_SELF,"D_"+sTag,nDone);
                SetLocalInt(OBJECT_SELF,"Reset",nReset);

                object oidDoor= GetLocalObject(OBJECT_SELF,"Door");
                if (oidDoor != OBJECT_INVALID)
                {
                    SetPlotFlag(oidDoor,0);
                    DestroyObject(oidDoor,GetLocalFloat(OBJECT_SELF,"ResetDelay"));
                }

            }


            int nBestSkill = -50;
            object oidBestSearcher = OBJECT_INVALID;
            int nCount = 1;

            // Find the best searcher within the search radius.
            object oidNearestCreature = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE);
            int nDoneSearch = 0;
            int nFoundPCs = 0;

            while ((nDone == 0) && (nDoneSearch == 0) && (oidNearestCreature != OBJECT_INVALID))
            {
                if(GetMaster(oidNearestCreature) != OBJECT_INVALID || GetIsPC(oidNearestCreature))
                {
                    // what is the distance of the PC to the door location
                    float fDist = GetDistanceBetween(OBJECT_SELF,oidNearestCreature);

                    if (fDist <= fSearchDist)
                    {
                        int nSkill = GetSkillRank(SKILL_SEARCH,oidNearestCreature);

                        if (nSkill > nBestSkill)
                        {
                            nBestSkill = nSkill;
                            oidBestSearcher = oidNearestCreature;
                        }
                        nFoundPCs = nFoundPCs +1;
                    }
                    else
                    {
                        // If there is no one in the search radius, don't continue to search
                        // for the best skill.
                        nDoneSearch = 1;
                    }
                }
                nCount = nCount +1;
                oidNearestCreature = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, OBJECT_SELF ,nCount);
            }

            if ((nDone == 0) && (nFoundPCs != 0) && (GetIsObjectValid(oidBestSearcher)))
            {
                int nMod = d20();
                if (GetIsInCombat(oidBestSearcher) == FALSE)
                {

                        // did we find it.
                    if ((nBestSkill +nMod) > nDiffaculty)
                    {
                        location locLoc = GetLocation (OBJECT_SELF);
                        object oidDoor;
                        // yes we found it, now create a trap door for us to use. it.
                        oidDoor = CreateObject(OBJECT_TYPE_PLACEABLE,"hidden_wall_door",locLoc,TRUE);

                        //Apply some Visual FX
                        effect vEffect = EffectVisualEffect(VFX_FNF_SUNBEAM);
                        ApplyEffectToObject(DURATION_TYPE_INSTANT, vEffect, GetObjectByTag("ratdoorfx"));

                        SetLocalString( oidDoor, "Destination" , "DST_"+sTag );
                        // make this door as found.
                        SetLocalInt(OBJECT_SELF,"D_"+sTag,1);
                        SetPlotFlag(oidDoor,1);
                        SetLocalObject(OBJECT_SELF,"Door",oidDoor);
                        //Send message to PC that the door was found
                        //SendMessageToPC(oidBestSearcher, "");

                        //Create destination Door at waypoint "Door2_"+sTag
                        //location lTargetDoor = GetLocation(GetWaypointByTag("DOOR2_" + sTag));
                        location lTargetDoor = GetLocation(GetObjectByTag("objDOOR2_" + sTag));
                        object oDoor2 = CreateObject(OBJECT_TYPE_PLACEABLE,"hidden_wall_door",lTargetDoor,TRUE);
                        //Set facing on the second door
                        AssignCommand(oDoor2,SetFacing(GetFacing(GetObjectByTag("objDOOR2_" + sTag))));
                        // make this second door as found.
                        SetLocalString(oDoor2, "Destination", "RET_" + sTag);
                        SetPlotFlag(oDoor2,1);
                        SetLocalObject(OBJECT_SELF,"Door",oDoor2);

                    } // if skill search found
                }//if not in Combat
            } // if Object is valid
        }//if the distance between the Rat and the door is < 2.5m
        //else
        //{
        //}
    }//if the rat is valid

}

