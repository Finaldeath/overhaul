//::///////////////////////////////////////////////
//:: q2c24c_hid_grate
//:: Copyright (c) 2001-2 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script runs on the Hidden Grate invisible object.
    This script will do a check and see if any PC comes
    within a radius of this object.

    If the PC has the search skill or is an Elf then
    a search check will be made.

    It will create a Trap or Wall door that will have
    its Destination set to a waypoint that has
    a tag of D_<tag of this object>
    The radius is determined by the Reflex saving
    throw of the invisible object

    The DC of the search stored by the Willpower
    saving throw.

*/
//:://////////////////////////////////////////////
//:: Created By  : Robert Babiak
//:: Created On  : June 25, 2002
//::---------------------------------------------
//:: Modifyed By : Cori
//:: Modifyed On : August 2003
//:://////////////////////////////////////////////

void main()
{
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_CREATE_ONCE");
    if(nDoOnce == 1)
         return;
    // get the radius and DC of the secret door.
    float fSearchDist = IntToFloat(GetReflexSavingThrow(OBJECT_SELF));
    int nDifficulty = GetWillSavingThrow(OBJECT_SELF);

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

        object oDoor= GetLocalObject(OBJECT_SELF,"Door");
        if (oDoor != OBJECT_INVALID)
        {
            SetPlotFlag(oDoor,0);
            DestroyObject(oDoor,GetLocalFloat(OBJECT_SELF,"ResetDelay"));
        }

    }


    int nBestSkill = -50;
    object oBestSearcher = OBJECT_INVALID;
    int nCount = 1;

    // Find the best searcher within the search radius.
    object oNearestCreature = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
    int nDoneSearch = 0;
    int nFoundPCs = 0;

    while ((nDone == 0) &&
           (nDoneSearch == 0) &&
           (oNearestCreature != OBJECT_INVALID)
          )
    {
        // what is the distance of the PC to the door location
        float fDist = GetDistanceBetween(OBJECT_SELF,oNearestCreature);

        if (fDist <= fSearchDist)
        {
            int nSkill = GetSkillRank(SKILL_SEARCH,oNearestCreature);

            if (nSkill > nBestSkill)
            {
                nBestSkill = nSkill;
                oBestSearcher = oNearestCreature;
            }
            nFoundPCs = nFoundPCs +1;
        }
        else
        {
            // If there is no one in the search radius, don't continue to search
            // for the best skill.
            nDoneSearch = 1;
        }
        nCount = nCount +1;
        oNearestCreature = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF ,nCount);
    }

    if ((nDone == 0) &&
        (nFoundPCs != 0) &&
        (GetIsObjectValid(oBestSearcher))
       )
    {
       int nMod = d20();

            // did we find it.
       if ((nBestSkill +nMod > nDifficulty))
       {
            location lLoc = GetLocation (OBJECT_SELF);
            object oDoor;
            object oTask;
            object oMap = GetObjectByTag("q2c24c_way_rocks");
            SetMapPinEnabled(oMap,1);
            // yes we found it, now create the appropriate door
            PrintString("Door created");
            oDoor = CreateObject(OBJECT_TYPE_PLACEABLE,"q2c24c_grate",lLoc,TRUE);
            oTask = CreateObject(OBJECT_TYPE_CREATURE,"q2c24c_hobgoblin",lLoc,TRUE);
            int nLen = GetStringLength(sTag);
//            SetLocalString( oDoor, "Destination" , "D_" + sTag );
//            object oDest = GetNearestObjectByTag(GetLocalString(oDoor, "Destination"));
            PlayVoiceChat(VOICE_CHAT_LOOKHERE, oBestSearcher);
            // make this door as found.
            SetLocalInt(OBJECT_SELF,"D_"+sTag,1);
            SetPlotFlag(oDoor,1);
            SetLocalObject(OBJECT_SELF,"Door",oDoor);

            SetLocalInt(OBJECT_SELF, "DO_CREATE_ONCE", 1);

       } // if skill search found
    } // if Object is valid
}

