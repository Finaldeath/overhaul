void main()
{
    if(GetIsPC(GetLastPerceived()))
    {
        object oDummy = GetNearestObjectByTag("M1Q0BDummy02");
        DelayCommand(12.0,ActionAttack(oDummy));
        DelayCommand(24.0,ClearAllActions());
    }
}
