//::///////////////////////////////////////////////
//:: Die Roll: 3d10
//:: DieRoll_G_3d10.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Creates a 3d10 broadcast string.
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
    int i1d10 = Random(10)+1;
    int i2d10 = Random(10)+1;
    int i3d10 = Random(10)+1;
    int iTotal = i1d10 + i2d10 + i3d10;

    //Convert the rolls and totals to strings
    string s1d10 = IntToString(i1d10);
    string s2d10 = IntToString(i2d10);
    string s3d10 = IntToString(i3d10);
    string sTotal = IntToString(iTotal);

    //Compile the string to be broadcast and save it out as a local
    string sBroadcast = sName+" rolls 3d10 ("+s1d10+", "+s2d10+", "+s3d10+"): TOTAL = "+sTotal+".";
    SetLocalString(oRoller, "DiceBagBroadcast", sBroadcast);
}
