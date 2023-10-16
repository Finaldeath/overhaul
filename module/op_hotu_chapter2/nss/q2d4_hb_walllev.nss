//::///////////////////////////////////////////////
//:: Secret Wall of Swords lever
//:: q2d4_hb_walllev
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This Invisable object will do a check and see
    if any pc comes within a radius of this object.

    If the PC has the search skill or is a elf then
    a search check will be made.

    It will create a lever that controls the wall of swords

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
//:://////////////////////////////////////////////

void main()
{
    // get the radius and DC of the secret door.
    float fSearchDist = IntToFloat(GetReflexSavingThrow(OBJECT_SELF));
    int nDiffaculty = GetWillSavingThrow(OBJECT_SELF);

    // has it been found?
    int nDone = GetLocalInt(OBJECT_SELF,"nFound");
    int nReset = GetLocalInt(OBJECT_SELF,"Reset");

    // ok reset the door is destroyed, and the done and reset flas are made 0 again

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
        (GetIsObjectValid(oidBestSearcher) && GetDetectMode(oidBestSearcher) == DETECT_MODE_ACTIVE)
       )
    {
       int nMod = d20();

            // did we find it.
       if ((nBestSkill +nMod > nDiffaculty))
       {
            // what is the tag of the lever to be created
            string sTag = "q2d4walllever";

            location locLoc = GetLocation (OBJECT_SELF);
            object oidDoor;
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DISPEL), locLoc);
            // yes we found it, now create a trap door for us to use. it.
            object oLever = CreateObject(OBJECT_TYPE_PLACEABLE,sTag,locLoc,TRUE);
            PlayVoiceChat(VOICE_CHAT_LOOKHERE, oidBestSearcher);
            // make this door as found.
            SetLocalInt(OBJECT_SELF,"nFound", 1);
            DestroyObject(OBJECT_SELF, 3.0);

       } // if skill search found
    } // if Object is valid
}

