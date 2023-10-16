// * machine sets combo for the first puzzle
void main()
{
    SetLocalString(GetArea(OBJECT_SELF), "NW_GAREA_GONGPUZZLE_3", "323");
//    object oSound1 =  GetNearestObjectByTag("M4Q1C2_GONG1");
    object oSound2 =  GetNearestObjectByTag("M4Q1C2_GONG2");
    object oSound3 =  GetNearestObjectByTag("M4Q1C2_GONG3");
    ClearAllActions();
    if (GetIsObjectValid(oSound3) == TRUE)
    {
        DelayCommand(3.0,SoundObjectPlay(oSound3));
    }
    DelayCommand(3.0,AssignCommand(GetObjectByTag("M4Q1C07_GONG_3"),ActionSpeakStringByStrRef(57985)));
    if (GetIsObjectValid(oSound2) == TRUE)
    {
        DelayCommand(4.0,SoundObjectPlay(oSound2));
    }
    DelayCommand(4.0,AssignCommand(GetObjectByTag("M4Q1C07_GONG_2"),ActionSpeakStringByStrRef(57985)));
    if (GetIsObjectValid(oSound3) == TRUE)
    {
        DelayCommand(5.0,SoundObjectPlay(oSound3));
    }
    DelayCommand(5.0,AssignCommand(GetObjectByTag("M4Q1C07_GONG_3"),ActionSpeakStringByStrRef(57985)));
    DelayCommand(30.0, ActionCastSpellAtObject(SPELL_FIRE_STORM, OBJECT_SELF, METAMAGIC_ANY, TRUE));
}

