//::///////////////////////////////////////////////
//:: Secret Door invis object
//:: V 1.1
//:: q5_hiddr_trig_hb
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This Invisable object will do a check and see
    if any pc comes within a radius of this object.

    ** PC MUST HAVE ROD OF RULER - if he does - he finds
    the door **

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
//:: Created By: Robert Babiak
//:: Created On: June 25, 2002
//:://////////////////////////////////////////////

#include "q2_inc_plot"

void main()
{
    // get the radius and DC of the secret door.
    float fSearchDist = IntToFloat( GetReflexSavingThrow ( OBJECT_SELF ) );
    int nDiffaculty   = GetWillSavingThrow   ( OBJECT_SELF );

    // what is the tag of this object used in setting the destination
    string sTag = GetTag(OBJECT_SELF);

    // has it been found?
    int nDone = GetLocalInt(OBJECT_SELF,"D_"+sTag);

    int nBestSkill = -50;
    object oidBestSearcher = OBJECT_INVALID;
    int nCount = 1;

    // Find the best searcher within the search radius.
    object oidNearestCreature = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);

    object oRod;

    while ( ( nDone == 0                                   ) &&
            ( oidNearestCreature != OBJECT_INVALID         )
          )
    {
        // what is the distance of the PC to the door location
        float fDist = GetDistanceBetween(OBJECT_SELF,oidNearestCreature);

        if ( fDist <= fSearchDist )
        {
            oRod = GetItemPossessedBy(oidNearestCreature, "q5rodofruler");
            if (GetIsObjectValid(oRod) == TRUE)
            {
                oidBestSearcher = oidNearestCreature;
            }
        }
        nCount = nCount +1;
        oidNearestCreature = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF ,nCount);
    }

    if ( ( nDone == 0                                   ) &&
         ( GetIsObjectValid( oidBestSearcher )          )
       )
    {
            location locLoc = GetLocation (OBJECT_SELF);
            object oidDoor;
            // yes we found it, now create a trap door for us to use. it.
            oidDoor = CreateObject(OBJECT_TYPE_PLACEABLE,"pl_hiddendr005",locLoc,TRUE);
            SetLocalString( oidDoor, "Destination" , "DST_"+sTag );
            // make this door as found.
            SetLocalInt(OBJECT_SELF,"D_"+sTag,1);
            SetPlotFlag(oidDoor,1);
            FloatingTextStrRefOnCreature(40402, oidBestSearcher);
            AssignCommand(oidBestSearcher, ClearAllActions());
            AssignCommand(oidBestSearcher, PlayVoiceChat(VOICE_CHAT_LOOKHERE, oidBestSearcher));
            //AssignCommand(oidBestSearcher, PlaySound("as_cv_bell1"));


        // if skill search found
    } // if Object is valid
}
/*lInt(OBJECT_SELF,"D_"+sTag,1);
            SetPlotFlag(oidDoor,1);

       } // if skill search found
    } // if Object is valid
} */
