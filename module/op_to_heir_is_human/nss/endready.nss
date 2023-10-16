//::///////////////////////////////////////////////
//:: End Ready
//:: EndReady.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Sets the EndReady local so that the
     conversation end script knows to end the game
*/
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(OBJECT_SELF, "EndReady", TRUE);
}
