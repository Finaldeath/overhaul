//::///////////////////////////////////////////////
//:: Die Roll: 8d8
//:: DieRoll_G_8d8.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Creates a 8d8 broadcast string.
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
    int i1d8 = Random(8)+1;
    int i2d8 = Random(8)+1;
    int i3d8 = Random(8)+1;
    int i4d8 = Random(8)+1;
    int i5d8 = Random(8)+1;
    int i6d8 = Random(8)+1;
    int i7d8 = Random(8)+1;
    int i8d8 = Random(8)+1;
    int iTotal = i1d8 + i2d8 + i3d8 + i4d8 + i5d8 + i6d8 + i7d8 + i8d8;

    //Convert the rolls and totals to strings
    string s1d8 = IntToString(i1d8);
    string s2d8 = IntToString(i2d8);
    string s3d8 = IntToString(i3d8);
    string s4d8 = IntToString(i4d8);
    string s5d8 = IntToString(i5d8);
    string s6d8 = IntToString(i6d8);
    string s7d8 = IntToString(i7d8);
    string s8d8 = IntToString(i8d8);
    string sTotal = IntToString(iTotal);

    //Compile the string to be broadcast and save it out as a local
    string sBroadcast = sName+" rolls 8d8 ("+s1d8+", "+s2d8+", "+s3d8+", "+s4d8+", "+s5d8+", "+s6d8+", "+s7d8+", "+s8d8+"): TOTAL = "+sTotal+".";
    SetLocalString(oRoller, "DiceBagBroadcast", sBroadcast);
}
