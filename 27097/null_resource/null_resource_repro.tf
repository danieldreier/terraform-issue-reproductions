resource "null_resource" "repro" {
    triggers = {
        date = timestamp()
    }

    lifecycle {
        ignore_changes = [ triggers ]
    }
}