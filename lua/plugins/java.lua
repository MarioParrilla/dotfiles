return {
    {
        'nvim-java/nvim-java',
        config = function ()
            require('java').setup()
            require('lspconfig').jdtls.setup({
                settings = {
                    java = {
                        configuration = {
                            runtimes = {
                                {
                                    name = "JavaSE-21",
                                    path = '/Users/marioparrilla/Library/Java/JavaVirtualMachines/corretto-21.0.4/Contents/Home',
                                    default = true,
                                }
                            }
                        }
                    }
                }
            })
        end
    }
}
