//::///////////////////////////////////////////////
//:: Name x2_endcon_dstroy
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Randomly walk away and destroy yourself at the
    end of conversation
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  Dec 10/02
//:://////////////////////////////////////////////

void main()
{
    AssignCommand(OBJECT_SELF, ActionRandomWalk());
    DestroyObject(OBJECT_SELF, 5.0);
}
