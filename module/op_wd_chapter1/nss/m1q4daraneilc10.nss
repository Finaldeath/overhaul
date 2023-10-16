void main()
{
    if (GetLocalInt(OBJECT_SELF,"NW_L_GiveLocket") == 0)
    {
        SetLocalInt(OBJECT_SELF,"NW_L_GiveLocket",TRUE);
    }
}
