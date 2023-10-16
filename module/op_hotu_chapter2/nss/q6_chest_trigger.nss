//::///////////////////////////////////////////////
//:: nw_o2_dttrapdoor.nss
//:: Copyright (c) 2001-2 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script runs on either the Hidden Trap Door
    or Hidden Wall Door Trigger invisible objects.
    This script will do a check and see
    if any PC comes within a radius of this Trigger.

    If the PC has the search skill or is an Elf then
    a search check will be made.

    It will create a Trap or Wall door that will have
    its Destination set to a waypoint that has
    a tag of DST_<tag of this object>

    The radius is determined by the Reflex saving
    throw of the invisible object

    The DC of the search stored by the Willpower
    saving throw.

*/
//:://////////////////////////////////////////////
//:: Created By  : Robert Babiak
//:: Created On  : June 25, 2002
//::---------------------------------------------
//:: Modifyed By : Robert, Andrew, Derek
//:: Modifyed On : July - September
//:://////////////////////////////////////////////

void main()
{
    // get the radius and DC of the secret door.
    float fSearchDist = IntToFloat(GetReflexSavingThrow(OBJECT_SELF));
    int nDiffaculty = GetWillSavingThrow(OBJECT_SELF);

    // if the compass is active than it is easier to find the chest
    if(GetLocalInt(GetArea(OBJECT_SELF), "COMPASS_ACTIVE") == 1)
    {
        fSearchDist = 12.0;
        nDiffaculty = 1;
    }

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

    while ((nDone == 0) &&
           (nDoneSearch == 0) &&
           (oidNearestCreature != OBJECT_INVALID)
          )
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

    if ((nDone == 0) &&
        (nFoundPCs != 0) &&
        (GetIsObjectValid(oidBestSearcher))
       )
    {
       int nMod = d20();

            // did we find it.
       if ((nBestSkill +nMod > nDiffaculty))
       {
            location locLoc = GetLocation (OBJECT_SELF);
            object oidDoor;
            // yes we found it, now create the appropriate door
            oidDoor = CreateObject(OBJECT_TYPE_PLACEABLE,"q6_mer_chest",locLoc,TRUE);
            PlayVoiceChat(VOICE_CHAT_LOOKHERE, oidBestSearcher);
            CreateObject(OBJECT_TYPE_PLACEABLE, "plc_magicpurple", locLoc);
            effect eVis = EffectVisualEffect(VFX_FNF_SOUND_BURST_SILENT);
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, locLoc);
            SetPlotFlag(OBJECT_SELF, FALSE);
            DestroyObject(OBJECT_SELF, 1.0);

       } // if skill search found
    } // if Object is valid
}

