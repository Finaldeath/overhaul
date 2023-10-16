//::///////////////////////////////////////////////
//:: q2_hiddoor
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
    a tag of <tag of this object>a or <tag of this object>b

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
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_CREATE_ONCE");
    if(nDoOnce == 1)
         return;
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

    object oidNearestCreature = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);

    int nInTreasureRoom = GetLocalInt(oidNearestCreature, "Q3B_IN_TREASURE_ROOM");
       if (nInTreasureRoom == 1)
       {
            /*int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
            if(nDoOnce == 1)
                return;
            SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);*/

            location locLoc = GetLocation (OBJECT_SELF);
            object oidDoor;
            // yes we found it, now create the appropriate door
            oidDoor = CreateObject(OBJECT_TYPE_PLACEABLE,"q2_secret_door",locLoc,TRUE);
            int nLen = GetStringLength(sTag);
            string sNewTag = GetStringLeft(sTag, nLen - 1);
            if(GetStringRight(sTag, 1) == "a")
                SetLocalString( oidDoor, "Destination" , sNewTag + "b" );
            else
                SetLocalString( oidDoor, "Destination" , sNewTag + "a" );
            PlayVoiceChat(VOICE_CHAT_LOOKHERE, oidNearestCreature);
            // make this door as found.
            SetLocalInt(OBJECT_SELF,"D_"+sTag,1);
            SetPlotFlag(oidDoor,1);
            SetLocalObject(OBJECT_SELF,"Door",oidDoor);
            SetLocalInt(OBJECT_SELF, "DO_CREATE_ONCE", 1);

       } // if skill search found

}

