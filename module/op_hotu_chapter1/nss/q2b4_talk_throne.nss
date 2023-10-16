//::///////////////////////////////////////////////
//:: Name: q2b4_talk_throne
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The first time you use the Throne of Bone, it
    will start its dialog file which will let you
    make a skill check to find a lever which will
    teleport you to the vampire's lair.
    //it will also start the conversation with the
    throne in the vampire lair to teleport you out
    of the lair
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Dec 10/02
//:://////////////////////////////////////////////

void main()
{
    ActionStartConversation(GetLastUsedBy());
}
