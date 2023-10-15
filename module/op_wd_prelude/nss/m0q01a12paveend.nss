////If conversation aborted and Pavel is at his leaving state
//// Initiate conversation with PC and say final line

void main()
{
    if (GetLocalInt(GetModule(),"PavelLeaves") ==99)
    ActionStartConversation(OBJECT_SELF);
}
