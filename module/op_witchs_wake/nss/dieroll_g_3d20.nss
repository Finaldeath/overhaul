//::///////////////////////////////////////////////
//:: Die Roll: 3d20
//:: DieRoll_G_3d20.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Creates a 3d20 broadcast string.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 24, 2002
//:://////////////////////////////////////////////

void main()
{
    //Figure out who rolled the dice
    object oRoller = GetPCSpeaker();
    string sName = GetName(oRoller);

    //Roll the dice and tally them up
    int i1d20 = Random(20)+1;
    int i2d20 = Random(20)+1;
    int i3d20 = Random(20)+1;
    int iTotal = i1d20 + i2d20 + i3d20;

    //Convert the rolls and totals to strings
    string s1d20 = IntToString(i1d20);
    string s2d20 = IntToString(i2d20);
    string s3d20 = IntToString(i3d20);
    string sTotal = IntToString(iTotal);

    //Compile the string to be broadcast and save it out as a local
    string sBroadcast = sName+" rolls 3d20 ("+s1d20+", "+s2d20+", "+s3d20+"): TOTAL = "+sTotal+".";
    SetLocalString(oRoller, "DiceBagBroadcast", sBroadcast);
}
