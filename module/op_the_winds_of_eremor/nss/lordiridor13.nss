//::///////////////////////////////////////////////
//:: Lord Iridor Conversation Script #13
//:: LordIridor#13
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Take Morgroth's Heart from the player and
    update the MainPlot local.
*/
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    object oHeart = GetObjectByTag("MorgrothsHeart");

    ActionTakeItem(oHeart, oPC);
    SetLocalInt(GetModule(), "MainPlot", 3);
}
