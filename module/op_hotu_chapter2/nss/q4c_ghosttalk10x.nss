//::///////////////////////////////////////////////
//:: q4c_ghostTalk10x
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets the Talk Variable on the Ghost to 10
    (introduction done, offer not heard)
*/
//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On: August 18, 2003
//:://////////////////////////////////////////////


void main()
{
    if(GetLocalInt(GetPCSpeaker(),"GhostTalk")<=10)
        {
        SetLocalInt(GetPCSpeaker(),"GhostTalk",10);
        }
}
