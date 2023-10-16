//Piper quest done successfully
void main()
{
    object oSword = GetItemPossessedBy(GetPCSpeaker(), "q1bpipersword");

    DestroyObject(oSword);

    SetLocalInt(GetModule(), "X1_PIPERQUEST", 30);
    ActionMoveToObject(GetObjectByTag("wp_piperhome"));
    DelayCommand(0.4, SetCommandable(FALSE, OBJECT_SELF));
    DestroyObject(OBJECT_SELF, 15.0);
    object oCommon1 = GetObjectByTag("q1g_pip_common1");
    object oCommon2 = GetObjectByTag("q1g_pip_common2");
    object oCommon3 = GetObjectByTag("q1g_pip_common3");
    object oCommon4 = GetObjectByTag("q1g_pip_common4");
    object oCommon5 = GetObjectByTag("q1g_pip_common5");
    object oCommon6 = GetObjectByTag("q1g_pip_common6");

    DestroyObject(oCommon1, 8.0);
    DestroyObject(oCommon2, 8.5);
    DestroyObject(oCommon3, 7.0);
    DestroyObject(oCommon4, 6.0);
    DestroyObject(oCommon5, 5.0);
    DestroyObject(oCommon6, 7.7);

    AssignCommand(oCommon1, ClearAllActions(TRUE));
    AssignCommand(oCommon2, ClearAllActions(TRUE));
    AssignCommand(oCommon3, ClearAllActions(TRUE));
    AssignCommand(oCommon4, ClearAllActions(TRUE));
    AssignCommand(oCommon5, ClearAllActions(TRUE));
    AssignCommand(oCommon6, ClearAllActions(TRUE));


    AssignCommand(oCommon1, ActionMoveToObject(GetObjectByTag("wp_pipcommon_" + IntToString(Random(5)+1))));
    AssignCommand(oCommon2, ActionMoveToObject(GetObjectByTag("wp_pipcommon_" + IntToString(Random(5)+1))));
    AssignCommand(oCommon3, ActionMoveToObject(GetObjectByTag("wp_pipcommon_" + IntToString(Random(5)+1))));
    AssignCommand(oCommon4, ActionMoveToObject(GetObjectByTag("wp_pipcommon_" + IntToString(Random(5)+1))));
    AssignCommand(oCommon5, ActionMoveToObject(GetObjectByTag("wp_pipcommon_" + IntToString(Random(5)+1))));
    AssignCommand(oCommon6, ActionMoveToObject(GetObjectByTag("wp_pipcommon_" + IntToString(Random(5)+1))));

    DelayCommand(1.0, SetCommandable(FALSE, oCommon1));
    DelayCommand(1.0, SetCommandable(FALSE, oCommon2));
    DelayCommand(1.0, SetCommandable(FALSE, oCommon3));
    DelayCommand(1.0, SetCommandable(FALSE, oCommon4));
    DelayCommand(1.0, SetCommandable(FALSE, oCommon5));
    DelayCommand(1.0, SetCommandable(FALSE, oCommon6));



    //Turn off sound object
    object oPiperSound = GetObjectByTag("q1bpipersound");
    SoundObjectStop(oPiperSound);
}
