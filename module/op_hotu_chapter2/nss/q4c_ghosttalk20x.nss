//::///////////////////////////////////////////////
//:: q4c_ghostTalk20x
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets the Talk Variable on the Ghost to 20
    (offer heard)
*/
//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On: August 18, 2003
//:://////////////////////////////////////////////


void main()
{
    if(GetLocalInt(GetPCSpeaker(),"GhostTalk")<=20)
        {
        SetLocalInt(GetPCSpeaker(),"GhostTalk",20);
        }
}
