///Speak line and attack if Aribeth not in prison

void main()
{

    if (GetLocalInt(GetModule(), "NW_G_M4Q01PLOT_ARIBETH_SURRENDER") !=1)
        {
            SetLocalInt(OBJECT_SELF,"Hostile",1);
            ActionStartConversation(OBJECT_SELF);
        }

    else

        {
            SetLocalInt(OBJECT_SELF,"Hostile",99);
            ActionStartConversation(OBJECT_SELF);
        }
}
