//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Set that someone tried to threaten him for gold
     and small chaotic hit.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On:Feb 25, 2002
//:://////////////////////////////////////////////
void main()
{
    SetLocalInt(OBJECT_SELF,"X1_HOUSEGUYROBBED",10);
    AdjustAlignment(GetPCSpeaker(), ALIGNMENT_CHAOTIC, 3);
}
