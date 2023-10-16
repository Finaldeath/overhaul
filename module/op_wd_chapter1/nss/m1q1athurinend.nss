void main()
{
    if(GetLocalInt(GetModule(),"NW_Thurin_Plot") >= 200)
    {
        ActionMoveToObject(GetObjectByTag("M1S4A_M1Q3A"));
        ActionDoCommand(DestroyObject(OBJECT_SELF));
    }
}
