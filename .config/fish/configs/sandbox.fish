function sandbox-fedora
	docker run -i -t fedora /bin/bash
end

function sandbox-debian
	docker run -i -t debian /bin/bash
end

function sandbox-ubuntu
	docker run -i -t ubuntu /bin/bash
end

function sandbox-arch
	docker run -i -t archlinux /bin/bash
end

function sandbox-crux
	docker run -i -t crux /bin/bash
end

function sandbox-centos
	docker run -i -t centos /bin/bash
end

function sandbox-mageia
	docker run -i -t mageia /bin/bash
end

function sandbox-opensuse
	docker run -i -t opensuse /bin/bash
end
